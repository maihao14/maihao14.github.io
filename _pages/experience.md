---
title: "Experience"
permalink: /experience/
layout: single
classes: wide
---

<p class="page-intro">I build machine learning systems end to end: architecture, training data, experimentation, orchestration, evaluation, and deployment. Client-facing work below is described in generalized terms to avoid exposing unnecessary implementation details.</p>

{% for item in site.data.experience %}
  <section class="experience-block">
    <div class="experience-block__header">
      <div>
        <p class="experience-block__org">{{ item.organization }}</p>
        <h2>{{ item.role }}</h2>
        <p class="experience-block__meta">{{ item.location }}</p>
      </div>
      <p class="experience-block__period">{{ item.period }}</p>
    </div>
    <p>{{ item.summary }}</p>
    <ul>
      {% for bullet in item.bullets %}
        <li>{{ bullet }}</li>
      {% endfor %}
    </ul>
    <p class="stack-line">Stack: {{ item.stack }}</p>
  </section>
{% endfor %}
