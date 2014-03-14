---
layout: post
title:  Starred Entry Feed
author: Ben Ubois
author_link: https://twitter.com/bsaid
---

There is now an optional RSS feed of your starred items available. To enable it, visit your [settings page](https://feedbin.com/settings) and check the "Enable starred entry feed" option. After saving your settings a link to your starred RSS feed will be displayed.

The URL will look something like `https://feedbin.com/starred/Lx3E5w94M3mOKFtcttHK8w.xml` the part at the end is a unique random value assigned to your feed. The URL to your starred feed is not easily guessable, but anyone with your URL can view your feed.

I use this feed to automatically add starred entries to [Pinboard](https://pinboard.in). You can do this too using [IFTTT](https://ifttt.com/). To set this up you'll want to create a new "Feed" recipe. 

 - Under "Choose a Trigger" select "New feed item". 
 - Under "Feed URL" Enter your starred entries URL.
 - Select Pinboard as your action channel.
 - In the "Complete Action Fields" form I use these settings
   - URL: `{{ "{{EntryUrl" }}}}`
   - Description `{{ "{{EntryTitle" }}}}`

Now any new entries you star will show up in Pinboard. [IFTTT](https://ifttt.com/) offers many other actions you can perform on an RSS feed so I encourage you to check it out.
   
