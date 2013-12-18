---
layout: post
title: View Changes in Updated Articles
author: Ben Ubois
---

![View Changes](/assets/images/2013-12-18/view-changes.gif)

Feedbin has been updating articles if they change after they were originally published for a little while. When this was added, Feedbin would also save the original article.

This feature provides a way to see the differences between the article when it was first picked up by Feedbin and the latest version.

I had been thinking about this feature for a while but lacked a way to show differences in HTML markup effectively. There are many libraries for showing the differences in two pieces of text, but most of them don't take HTML into account. The answer came the other day when I saw [this tweet](https://twitter.com/evil_trout/status/411580730745966593) about [Discourse's](http://www.discourse.org/) updated post history interface which included a nice HTML inline diff option. So Feedbin uses the code from Discourse which I [packaged into a Gem](https://github.com/feedbin/html_diff).
