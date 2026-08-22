---
layout: link
title: "Test title"
date: 2025-03-03
direct_link: https://github.com/koaning/smartfunc
via_link: https://news.ycombinator.com
---

Vincent ... (koanig on Github) created smartfunc to "Turn docstrings into LLM-functions".

Vincent shared a picture of the API on Bluesky, which looks something like this:

```python
from smartfunc import backend
from pydantic import BaseModel

class Summary(BaseModel):
    summary: str
    pros: list[str]
    cons: list[str]

llmify = backend("gpt-4o-mini", system="You are a helpful assistant.", temperature=0.5)

@llmify
def generate_poke_desc(text: str) -> Summary:
    """Describe the following pokemon: {{ text }}"""
    pass
```

So `backend` is creating a decorator for a prompt template, itself relying on the docstring in a function... how does this work?
