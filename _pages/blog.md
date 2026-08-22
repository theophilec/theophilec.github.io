---
layout: default
permalink: /blog/
title: blog
nav: true
pagination:
  enabled: false
---

<h2>blog</h2>
<br>

<div class="post">
  {% assign postlist = site.posts %}
  {% if postlist.size > 0 %}
    <div style="display: table; width: 100%; border-collapse: collapse;">
      {% for post in postlist %}
        {% unless post.draft %}
          <div style="display: table-row;">
            <div style="display: table-cell; width: 20%; padding: 0.3rem 1rem 0.3rem 0; white-space: nowrap; vertical-align: top; font-weight: bold;">
              {{ post.date | date: '%b %d, %Y' }}
            </div>
            <div style="display: table-cell; padding: 0.3rem 0; vertical-align: top;">
              <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
              {% if post.description %}<br><span>{{ post.description }}</span>{% endif %}
            </div>
          </div>
        {% endunless %}
      {% endfor %}
    </div>
  {% else %}
    <p>No posts so far...</p>
  {% endif %}
</div>
