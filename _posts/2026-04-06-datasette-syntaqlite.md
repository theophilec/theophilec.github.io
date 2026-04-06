---
layout: post
title: "datasette-syntaqlite: adding SQL linting to Datasette"
date: 2026-04-06
description: 
categories: 
---

`datasette-syntaqlite` is a [Datasette](https://datasette.io/) plugin that augments Datasette's query editor using [`syntaqlite`](https://github.com/LalitMaganti/syntaqlite). Currently it catches syntax errors and incorrect columns based on available tables and views.

You can check out the code [here](https://github.com/theophilec/datasette-syntaqlite) or add it to your Datasette project using `uv add datasette-syntaqlite`.

I use Datasette on a weekly basis for a lot of my side projects and while data wrangling for my [volunteering](https://mines-paris.org). I have been wanting to improve the experience for my use cases and [syntaqlite](https://github.com/LalitMaganti/syntaqlite)'s creator [Lalit Maganti](https://lalitm.com)'s [blog post](https://lalitm.com/post/building-syntaqlite-ai/) spurred me to spend a few hours building this tool. Claude (in Zed) wrote a first version I then rewrote. The js part is largely untouched as I am not familiar with how to make it better.

This is a side project but I am interested in pushing it further:
- Integrating the language server aspect with edit prediction
- Replacing Datasette's formatting with syntaqlite's

Oh and this is unrelated but I'd like to add a `Cmd+Enter` run query keyboard shortcut like in [Metabase](https://metabase.com) which we use at work.

If you want to contribute, feel free to contact me.

The plugin is open-source and Apache 2.0 licensed. Big thanks to [Simon Willison](https://simonwillison.net/) and [Lalit Maganti](https://lalitm.com) for doing the heavy lifting here.
