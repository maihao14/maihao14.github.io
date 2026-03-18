---
title: "Publications"
permalink: /publications/
layout: single
classes: wide
---

<p class="page-intro">Selected publications and thesis work focused on earthquake detection, phase picking, seismic dataset creation, and signal processing.</p>

<div class="publication-stack">
  {% for publication in site.data.publications %}
    <article class="publication-entry">
      <h2><a href="{{ publication.url }}">{{ publication.title }}</a></h2>
      {% if publication.publisher %}
        <p class="publication-entry__meta">{{ publication.publisher }}</p>
      {% endif %}
      <p>{{ publication.note }}</p>
    </article>
  {% endfor %}
</div>
