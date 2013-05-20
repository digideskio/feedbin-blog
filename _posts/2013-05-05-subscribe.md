---
layout: post
title:  Subscribe
author: Ben Ubois
---

Even before I started working on Feedbin, I was always looking for easy ways to subscribe to feeds. This was something I was so obsessed with that I wrote an [iPhone app](http://subscribeapp.com/) to manage your Google Reader subscriptions as well as a script to [subscribe using Hubot](https://github.com/github/hubot-scripts/blob/master/src/scripts/google-reader.coffee).

My favorite idea I had for subscribing was through email. Email is ubiquitous so it's always easy to send a link in an email message. 

I'm pleased to announce that you can now subscribe to a Website's RSS feed using email. If you check out your [Settings](https://feedbin.me/settings) page, you'll see a "Subscribe via Email" section. In this section you'll find a private subscribe email address.

To subscribe via email, send an email to this address with a link to the Website or feed. If Feedbin finds a feed, you will be subscribed to it. Add this email address to your address book to make it easy on yourself.

Feedbin looks for tags like:

    <link rel="alternate" type="application/atom+xml" title="Feedbin Blog" href="http://blog.feedbin.me/atom.xml" />

So if the website does not have this it won't be able to subscribe. Also for websites that offer multiple feeds, Feedbin will choose the first one, as this is usually the main feed for the website.


The other new way to subscribe is through a URL like: 

    https://feedbin.me/?subscribe=http://blog.feedbin.me/atom.xml

This will let you subscribe through a [bookmarklet](https://github.com/feedbin/support/issues/45#issuecomment-17382583) or through [Superfeeder's](http://superfeedr.com/) cool subscribe button, [SubToMe](https://www.subtome.com/).