---
---
<nav class="content">
  <div class="navigation__container">
    <label class="navigation__menu-toggle" for="menu"><span class="cross"></span></label>
    <div class="navigation__category">Navigation</div>
    <ul class="navigation__link-list">
      {% for link in site.data.navigation %}
        <li class="navigation__link-list-item{% if current_url == link.url %} navigation__link-list-item--active{% endif %}{% unless link.available %} navigation__link-list-item--unavailable{% endunless %}">
          <a class="navigation__link-list-link{% if current_url == link.url %} navigation__link-list-link--active{% endif %}" href="{{ link.url | prepend: site.baseurl }}">
            {{ link.text }}
          </a>
        </li>
      {% endfor %}
    </ul>
  </div>
</nav>
