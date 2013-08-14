---
layout: post
title:  Graphing Feedbin
author: Ben Ubois
---

Feedbin uses [Librato Metrics](http://metrics.librato.com) for graphing. It even works great for monitoring systems. For example [this shell script](https://gist.github.com/benubois/6115235) generates a set of graphs for one of the web servers like:

<img src="/assets/images/2013-08-14/www1.png" style="max-width: 965px;" />

For monitoring various other services, Feedbin uses a [ruby script](https://gist.github.com/benubois/6115402) that gets run once per minute using [Sidekiq](https://github.com/mperham/sidekiq).

This produces some great metrics about Redis, Postgres and Memcached:

<img src="/assets/images/2013-08-14/services.png" style="max-width: 1274px;" />
