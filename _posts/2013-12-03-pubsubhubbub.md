---
layout: post
title: PubSubHubbub
author: Ben Ubois
---

Feedbin now supports the [PubSubHubbub](http://en.wikipedia.org/wiki/PubSubHubbub) or PuSH protocol.

Refreshing feeds without PuSH is inefficient. The process is to download every feed, look at every item in the feed to check for new content, then repeat this many times a day to stay up to date.

PuSH is great because instead of downloading the entire feed over and over again, PuSH sends new content to Feedbin making it so articles show up right after they are published. Feedbin already has thousands of articles getting pushed every hour.

![PuSH](/assets/images/2013-12-03/push.png)

[Julien Genestoux](http://about.me/julien) from [Superfeedr](http://superfeedr.com/) took me up on my offer to [pair with me]({% post_url 2013-09-26-pair-with-me %}) on this. Julien knows the PubSubHubbub protocol well and I could help out with my knowledge of the Feedbin codebase. It was a great experience and I think it came together more quickly than if either of us had attempted to do it alone.

About 20% of feeds in Feedbin support PuSH and it would be great to increase this. If you own a blog or a site that publishes RSS feeds and you want to make sure your updates are propagated faster to Feedbin, you should also implement PubSubHubbub on your end. It's a completely open (and free!) protocol. You can use a community hub like [http://pubsubhubbub.superfeedr.com](http://pubsubhubbub.superfeedr.com) for this.