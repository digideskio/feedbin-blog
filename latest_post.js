---
layout: nil
---
$(function () {
	feedbin.blogContent('{% for post in site.posts limit:1 %} {"title": "{{ post.title | xml_escape }}", "url": "{{ site.domain }}{{ post.url }}" } {% endfor %}');
});
