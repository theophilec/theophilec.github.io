---
layout: post
title: "Animating SVGs with Claude 3.5 Sonnet"
date: 2025-01-09
description: Reproducing some ideas from HN.
categories: llm, art
---


Following the Arxiv-submission of [NeuralSVG](https://sagipolaczek.github.io/NeuralSVG/), a HN commenter [shared](https://news.ycombinator.com/item?id=42638558) their experiment animating an SVG using Claude 3.5 Sonnet.

I tried with [Mines Paris Alumni](https://mines-paris.org)'s SVG logo with Claude 3.5 Sonnet, online. One gotcha is that you must past the SVG contents instead of upload it.

Here is the prompt:
```
Animate this SVG to make the text appear below. Make it very corporate and professional.
```

and the initial logo :

![Animated Mines Paris Alumni logo](assets/img/20250109-initial-logo.svg)

Here are the results (the second one was asked to be more "exciting"):
![Animated Mines Paris Alumni logo](assets/img/20250109-animated-logo.svg)
![Animated Mines Paris Alumni logo](assets/img/20250109-animated-logo-1.svg)

Then, making it have flashing colours, it loses some text it cannot recover despite my coaxing
(and the site says an output limit has been reached).
![Animated Mines Paris Alumni logo](assets/img/20250109-animated-logo-2.svg)
![Animated Mines Paris Alumni logo](assets/img/20250109-animated-logo-3.svg)

In any case, super exciting and fun to play with!
