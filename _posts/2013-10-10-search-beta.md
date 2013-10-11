---
layout: post
title:  Search Beta
author: Ben Ubois
author_link: https://twitter.com/bsaid
---

<img src="/assets/images/2013-10-10/search.png" style="max-width: 317px;" class="no-border" />

I'm very happy to announce the availability of search for Feedbin. 

I'm calling it a beta because there are still improvements to be made and bugs that have not been found, so I'd appreciate your [feedback](https://github.com/feedbin/support/issues).

Search supports some great advanced options like `AND`, `OR` and `NOT`. 

Have a lot of starred items? Try adding `is:starred` to your query to just search starred items. `is:read/unread` are also supported.

To search a specific feed, you can add `AND feed_id:XX`.

Results are is sorted by relavance by default, but you can optionally sort by date with `sort:asc/desc`.

Under the hood Feedbin is using [elasticsearch](http://www.elasticsearch.org/) to power all of this.

Due to the new field, subscribe has been moved and can be accessed by clicking on the dropdown next to search.