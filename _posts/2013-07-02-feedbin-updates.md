---
layout: post
title:  Feedbin Updates
author: Ben Ubois
---

**Reeder Update**

[Reeder 3.2 is out](https://itunes.apple.com/app/reeder/id325502379). This update brings support for the faster and more accurate version 2 of the Feedbin API. Between the API change and what I can only assume is some sort of magic added by [Silvio](https://twitter.com/reederapp), sync is fast. Very fast.

I encourage everyone to update because:

**API V1 Deprecation**

With the release of Reeder 3.2 all major clients are using version 2 of the API. I'd like to deprecate version 1 as soon as possible because it uses a ton of database resources. The index for the records that track read/unread information for V1 of the API has grown to about 30GB, most of it sitting in RAM at all times. Getting rid of this will be huge relief for the database server.

If you are still using V1 of the API for anything [please let me know](mailto:ben@feedbin.me). Version 2 is very similar except for the way it tracks read/unread information so it should be easy enough to switch over. [Check out the documentation](https://github.com/feedbin/feedbin-api) for more details.

**Pricing**

I [announced this on Twitter](https://twitter.com/feedbinapp/status/351701889081024512) yesterday but the price for new customers has gone up to $3/month or $30/year. The plan for the extra money is to be able to invest more in Feedbin. The types of things I'd like to spend the money on are [paying for top-of-the line hardware](http://blog.feedbin.me/2013/06/28/full-metal-hosting/), building expensive features like search and if I'm really lucky, hiring some help. It's hard to say whether it will pay off because I definitely expect less people to sign up.

The rates for all existing customers will remain the same. 

I was surprised and touched when [existing](https://twitter.com/barkerja_/status/351702445036023811) [customers](https://twitter.com/domserio/status/351709708538748929) [started](https://twitter.com/patcoll/status/351710648511627264) [saying](https://twitter.com/robertjacobsen/status/351768664254586881) they would pay more, given the option, so this is now possible in your [billing settings](https://feedbin.me/settings/billing).

**The Future**

Now that the server move is out of the way and v1 of the API is on the way out, some real work can begin. First up is a [long list of issues and feature requests](https://github.com/feedbin/support/issues?state=open) that have been ignored for far too long. After that [Todd](http://www.linkedin.com/in/toddjcollins) and I have a bit of a redesign in the works. Finally there is one surprise that could have a big impact on Feedbin, but I'm not quite ready to talk about that yet :)