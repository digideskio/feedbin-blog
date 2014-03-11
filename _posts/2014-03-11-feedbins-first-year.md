---
layout: post
title: Feedbin’s First Year
author: Ben Ubois
---

<div class="wallpaper">
	<div class="wallpaper-logo">
		<img src="{{ 'images/2014-03-11/birthday-promo.png' | asset_path }}" />
		&nbsp;
	</div>
</div>

Feedbin [launched](http://blog.feedbin.me/2013/03/12/rediscover-rss/) into a market with no future. Google owned RSS and they had let it languish.

That all changed when Google [announced](http://googleblog.blogspot.com.au/2013/03/a-second-spring-of-cleaning.html) they were shutting down Google Reader two days after Feedbin launched.

I built Feedbin because I still loved RSS but I didn't like Google Reader. It looked like it had been abandoned after the [last update in 2011](http://googlereader.blogspot.com/2011/10/new-in-reader-fresh-design-and-google.html) that attempted to prop up Google+ by removing many features.

The goal was to be able to cover costs in one year. Instead it took three weeks. It cost about $170/month to run Feedbin when it launched and with $1.62/user/month in profit after credit card fees it looked like I would need just over 100 customers who were also looking for a Google Reader alternative.

Feedbin has one of those boring business models that actually works. Charging money for a good or service. Feedbin will never have millions of customers but that's OK. It just needs you.

Timing was everything for Feedbin's success. I think having a halfway decent product only went so far as to not actively *hurt* Feedbin's chances. Of course Google Reader closing was the event that started it all, but gaining [Reeder](http://reederapp.com/) support early on gave Feedbin a built in audience.

Scaling
-------

Getting so much interest was exciting but also extremely challenging. Feedbin had scaling problems within the first few weeks as the number of feeds to refresh went up. For feed refreshing [Mike Perham's](http://www.mikeperham.com/) [Sidekiq](http://sidekiq.org/) was critical to getting acceptable refresh times. It's the fastest and least memory intensive background job processor I've used and it keeps getting better and better. Feedbin would have been tougher to build without it.

Scaling the background stuff was possible thanks to Sidekiq, but scaling the web facing side was more stressful. Feedbin was hosted on Heroku for the first four months. I was frequently turning on more front-end servers ([dynos](https://devcenter.heroku.com/articles/how-heroku-works#running-applications-on-dynos)) and bumping up the database plan. Once I was on the highest-end $6,400/month PostgreSQL plan, I knew I needed to try something else because there was nowhere else to go on Heroku.

I've heard Ruby isn't the fastest language and I'm sure my code could have been improved, but the performance didn't add up. I also still had a full time job at [Flickerbox](http://www.flickerbox.com/) back then so I didn't have time to diagnose what was going on.

With a copy of the production database running locally on an 11-inch MacBook Air, pages took a fraction of the time to load. The biggest difference between that environment and production was a solid-state drive. At the time Amazon did not offer any SSD options so I suspected Heroku Postgres was held back by running on spinning disks.

I started to look into dedicated hosting that had some hardware flexibility and settled on [SoftLayer](http://www.softlayer.com/). If you've never used a dedicated server before it's a breath of fresh air coming from AWS or any VPS. All those problems of noisy neighbors, poor I/O, weird LAN latency or other networking anomalies just go away. Oh yeah and it's fast.

<a href="{{ 'images/2014-03-11/performance-unread.png' | asset_path }}"><img src="{{ 'images/2014-03-11/performance-unread.png' | asset_path }}" ></a>

<figure>
	<a href="{{ 'images/2014-03-11/performance-feeds-entries.png' | asset_path }}"><img src="{{ 'images/2014-03-11/performance-feeds-entries.png' | asset_path }}" /></a>
	<figcaption>Response time for critical pages (left before move, right after move)</figcaption>
</figure>

On the day of the [move](http://blog.feedbin.me/2013/06/27/feedbin-server-move/) people [asked](https://twitter.com/khurtwilliams/status/350736255673307136) why Feedbin had to move on a weekday and the reason was that I didn't think I had a choice. I was looking at these graphs pretty sure that Feedbin was about to fall over.

For all this performance, surely the price must have gone way up? Well no. Feedbin's last bill on Heroku was for $7,997 and the first month's bill on SoftLayer was $3,932 so dedicated does not mean expensive.

Design
------

One of the things I'm most proud of about Feedbin is the design. The design has always been a collaboration between [Todd J. Collins](https://twitter.com/toddjcollins) and I. In the beginning it was more me, but starting with the [redesign](https://twitter.com/feedbin/status/365570562984128512) Todd has set the visual direction, which explains why it's gotten so good. Todd and I get together most Mondays to plan and design new features. For such a short window of time I think we get a lot done.

The design has evolved since my crude, static HTML mockups.

<figure>
	<a href="{{ 'images/2014-03-11/feedbin-screenshot-1.png' | asset_path }}"><img src="{{ 'images/2014-03-11/feedbin-screenshot-1.png' | asset_path }}" /></a>
	<figcaption>Early Feedbin HTML Mockup (October 2012)</figcaption>
</figure>

<figure>
	<a href="{{ 'images/2014-03-11/feedbin-screenshot-2.png' | asset_path }}"><img src="{{ 'images/2014-03-11/feedbin-screenshot-2.png' | asset_path }}" /></a>
	<figcaption>Feedbin at Launch (March 2013)</figcaption>
</figure>

<figure>
	<a href="{{ 'images/2014-03-11/feedbin-screenshot-3.png' | asset_path }}"><img src="{{ 'images/2014-03-11/feedbin-screenshot-3.png' | asset_path }}" /></a>
	<figcaption>Feedbin Now (March 2014)</figcaption>
</figure>

The RSS Market
--------------

I have no doubt that RSS is better for Google having folded their offering. There's so much choice now that it's actually a crowded market. It's also an area that attracts a lot of developers because everybody thinks they can build one (and they're right).

RSS is one of the last holdouts of a more open web and it's been gratifying to see that there's enough interest in it to sustain some great independent services that care more about the product than eyeballs.

The next time you read somebody declaring the death of RSS, you can just smile to yourself as you mark it as read in your favorite reader and move on to the next article.