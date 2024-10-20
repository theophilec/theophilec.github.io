---
layout: post
title: Chrome extension for logging attempts
date: 2024-10-20
description: Chrome extension for logging attempts in the Giskard RED Challenge.
categories: web, llm
---
I just released a [Chrome extension](https://github.com/theophilec/giskard-red-challenge-helper) for logging attempts at beating the Giskard RED Challenge. It is available on [Github](https://github.com/theophilec/giskard-red-challenge-helper) under the MIT License. It is written in Javascript with the help of Anthropic's Claude Sonnet.

Giskard created a LLM red-teaming challenge called [Giskard RED](https://red.giskard.ai). The goal is to make a model misbehave or fail (e.g. output invalid SQL, get off-topic, ...). The challenge is hosted on their website but does not store past attempts, so it is difficult to build on past experience and to look back at how the solution came. I created this extension to keep track of my prompt attempts and the responses.

## What it does

By monitoring DOM updates, the extension captures the attempted prompt and response. These are stored with other metadata in persistent storage (IndexedDB).

History can be viewed though a popup with a challenge selector. All stored data can be exported to JSON so it can be analysed or kept.

![Demo image](/assets/img/giskard-demo.png)


## Coding: MDN + Anthropic's Claude Sonnet

Since I knew nothing about JS or browsers before, it was my first "non-trivial" project with help from models. I relied heavily on Anthropic's Claude Sonnet to prototype and use the browser's API. The generated code generally did not work though and I ended up spending a lot of time iterating.

Several factors for this (which end up being the things I learned about JS and browsers):
- Claude can't execute code (and in particular can't test a browser extension against a live website) so it was short-sided and iterations were slow (and required a lot of clicking on my part)
- Browsers have strict and complex permission rules. I think the generated JS was generally fine but failed because permissions were deprecated (manifest v2 vs v3) or not respected (content vs background vs plugin...)
- Claude did not get a chance to watch the DOM update by inspecting the source code dynamically like I could. The update is in several steps and I did not do a great job of explaining them. It would be great to "record" a browser session to share the state.
- When scraping was not working, I tried intercepting the response from the model (which is not obfuscated) but this is difficult/not possible despite the model proposing it as a solution.

Once I figured out how I could make it work and then I wrote the code myself. Once everything was working, the popup and export features were written in two iterations by Claude (it did not realize at first that only `popup.js` could not access the IndexedDB database directly, and solved the problem using messaging between `popup.js` and `content.js`).

## Conclusion

Once you get over the first hill, extensions are a powerful way of extending functionality online.
