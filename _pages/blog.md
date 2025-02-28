---
layout: default
permalink: /blog/
title: blog
nav: true
---

<h2> blog</h2>
<br>

<div class="post">
{% assign blog_name_size = site.blog_name | size %}
{% assign blog_description_size = site.blog_description | size %}

{% if blog_name_size > 0 or blog_description_size > 0 %}

   <div class="news">
    <div
      class="table-responsive"
    >
      <table class="table table-sm table-borderless">
        {% assign latest_posts = site.posts %}
        {% for item in latest_posts %}
        {% if item.draft == false %}
          <tr>
            <th scope="row" style="width: 20%">{{ item.date | date: '%b %d, %Y' }}</th>
            <td>
                <a class="news-title" href="{{ item.url | relative_url }}">{{ item.title }}</a>
                <br> {{ item.description }}
            </td>
          </tr>
        {% endif %}
        {% endfor %}
      </table>
    </div>
  {% else %}
    <p>No posts so far...</p>
  {% endif %}
</div>
