---
layout: post
title: "datasette-keyboard-shortcuts: adding keyboard shortcuts to datasette"
date: 2026-08-23
description: 
categories: 
---
`datasette-keyboard-shortcuts` is a Datasette keyboard shortcut plugin I published on [Github](https://github.com/theophilec/datasette-keyboard-shortcuts/) and on [PyPi](https://pypi.org/project/datasette-keyboard-shortcuts/).

Installing it in you datasette virtual environment allows you to add and configure datasette keyboard shortcuts, through other plugins.

Initially, I wanted to add shortcuts for running and formatting queries. Figured, I'd make it generic so others could add their own use cases. 

Currently running and formatting queries are built-in actions. The plugin exposes a hook to allow other plugins to register additional plugins. To illustrate this, I had Claude write a [plugin](https://github.com/theophilec/datasette-homepage-shortcut) to map `CMD + SHIFT + H` to going to the Datasette homepage.
