---
layout: post
title: TIL: configuring HTTPS for Github Pages and OVH
date: 2024-12-10
description: For future reference...
categories: TIL, web
---

_This TIL is following configuring verified domains for two of my websites
hosted on Github Pages with HTTPS enabled._

1. Remove default DNS CNAME and A entries in OVH.
2. Add the A entries specified by GH Pages, and add TXT entries for domaine verification.
3. Add a CNAME entry for `www.domain.com` going to the default GH pages domain, i.e. `username.github.io` or `organization.github.io`.

Without the `www` subdomain entry, the DNS check fails and HTTPS cannot be enabled.
