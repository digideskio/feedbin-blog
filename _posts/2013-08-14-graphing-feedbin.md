---
layout: post
title:  Graphing Feedbin
author: Ben Ubois
author_link: https://twitter.com/bsaid
---

Feedbin uses [Librato Metrics](http://metrics.librato.com) for graphing. It even works well for monitoring systems. For example [this shell script](https://gist.github.com/benubois/6115235) generates a set of graphs for one of the web servers like:

<img src="{{ 'images/2013-08-14/www1.png' | asset_path }}" style="max-width: 965px;" />

For monitoring various other services, Feedbin uses a [ruby script](https://gist.github.com/benubois/6115402) that gets run once per minute using [Sidekiq](https://github.com/mperham/sidekiq).

This produces some great metrics about Redis, Postgres and Memcached:

<img src="{{ 'images/2013-08-14/services.png' | asset_path }}" style="max-width: 1274px;" />
