---
layout: post
title:  Never Miss an Update With the new Updated Section
author: Ben Ubois
---

Articles are frequently updated after being published, but once you've already read an article how would you know when new content was added?

The new **Updated** section aims to solve this problem.

<a href="{{ 'images/2014-12-16/updated.png' | asset_path }}"><img src="{{ 'images/2014-12-16/updated.png' | asset_path }}" /></a>

Articles will appear in the Updated section if:

- You've already read the article
- More than 50 characters have been added since you last read the article

Not all feeds have meaningful updates, so there is also a way to turn off updates for a feed on the [Feed Settings](https://feedbin.com/settings/feeds) page.

<figure>
  <a href="{{ 'images/2014-12-16/feed-settings.png' | asset_path }}"><img src="{{ 'images/2014-12-16/feed-settings.png' | asset_path }}" /></a>
	<figcaption>Click on the clock icon to toggle updates</figcaption>
</figure>

Feedbin also has an improved method for checking if an article has been updated. If there is any change in the length of an article, Feedbin will update the article. Previously it relied on the `<updated>` tag which was not always available.
