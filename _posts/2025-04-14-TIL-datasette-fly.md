---
layout: post
title: "TIL: Deploying Datasette on fly.io"
date: 2025-04-14
description: "with password authentication"
categories: llm datasette
---

For a new open data project, I get data from an RSS feed and scraping and do structured extraction and summarization using LLMs. I use SQLite for storage, and [Datasette](https://datasette.io) as a (temporary?) front-end.

To share my intermediate progress with my client, I use [fly.io](https://fly.io) hosting, with username authentication to access the data.

Datasette has a very rich plugin ecosystem. I used two of them to reach this goal:

1. [datasette-publish-fly](https://github.com/simonw/datasette-publish-fly), to be used in conjuction with the `datasette publish`.
2. [datasette-auth-passwords](https://github.com/simonw/datasette-auth-passwords), for authentication. It allows to set username and passwords and create access control. If you only install the plugin and share a password hash, logging in will work but won't be required to access the database. Access control configuration happens in `metadata.json` (see below or [documentation](https://github.com/simonw/datasette-auth-passwords/issues/7)).

Here is the basic `metadata.json` I used, which hides the database from everyone except logged-in users:

```json
{
  "databases": {
    "<database_name>": {
      "allow": {
        "id": "*"
      }
    }
  }
}
```
Then, I deployed with
```bash
uv run datasette publish fly <database_name>.db \
            --app="app_name" \
            -m metadata.json \
            --install datasette-auth-passwords \
            --plugin-secret datasette-auth-passwords <username>_password_hash 'pbkdf2_sha256...'
```
Above:
- `<username>` is the desired user name (it should be replaced everywhere above).
- `<hash>` is the hash of the password I chose. It is generated using the `echo "<password>" | uv run datasette hash-password --no-confirm` command provided by [datasette-auth-passwords](https://github.com/simonw/datasette-auth-passwords).
- `<database_name>` is the name of the database we want to hide behind authentication:

The login URL is: `https://<app_name>.fly.dev/-/login`.
