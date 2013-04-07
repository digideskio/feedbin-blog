---
layout: post
title:  Downtime Today
author: Ben Ubois
---

This morning I performed a database upgrade. The reason for the upgrade was to  have more RAM available to the database indexes. One important performance metric for databases is the [percentage of the index that can be kept in memory](http://www.craigkerstiens.com/2012/10/01/understanding-postgres-performance/). This number should be as close to 100% as possible and over the last week, Feedbin's had dropped to 94%. Time for an upgrade.

The database upgrade went smoothly, taking only about 6 minutes. However immediately after bringing the site back up, there were many connection timeout errors in the logs. The frustrating part was that the timeouts seemed random. There was still plenty of traffic getting through, but for many people, including me, the site was completely inaccessible. 

One thing that stood out to me was how long database queries were taking after the upgrade, for some reason the new database was _slower_ than the old one. I'm still trying to figure out why this is, but I'm thinking that the database takes time to figure out what it needs to keep in its cache. I believe that connections were timing out due to how long the database was taking to respond.

I'm sorry about any inconvenience this may have caused and will take extra precautions next time something as critical as the database is being upgraded.