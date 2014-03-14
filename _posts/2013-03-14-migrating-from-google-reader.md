---
layout: post
title:  Migrating from Google Reader
author: Ben Ubois
author_link: https://twitter.com/bsaid
---

[Google Reader is shutting down](http://googlereader.blogspot.com/2013/03/powering-down-google-reader.html) on July 1st 2013.

This wasn’t a huge surprise, but I spent a lot of time using it over the years and am sad to see it go.

If you’re looking for a way to migrate from Google Reader to Feedbin, here is what you need to do.

You can no longer export your subscription data from Google Reader directly. Instead, Google has a separate data export service called Google Takeout. On Takeout, you can [export your Google Reader data](https://www.google.com/takeout/?pli=1#custom:reader). This will give you a zip file, which you should unzip.

To import into Feedbin. Login and go to the [Import/Export page](https://feedbin.com/settings/import_export). Click *choose file* and navigate to where you extracted the Google Takeout zip. Select the file called *subscriptions.xml* and import.

As soon as you get the message that the import has started you can start using Feedbin, however it may take a few minutes for all of your feeds to show up. 
