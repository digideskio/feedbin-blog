---
layout: post
title:  Full Metal Hosting
author: Ben Ubois
---

Feedbin is now running in its new home at [SoftLayer WDC01](http://www.softlayer.com/).

I wanted to talk a bit about the architecture and hardware that's being used.

<img src="/assets/images/2013-06-28/architecture.png" style="max-width: 697px;" />

The Data Center
---------------

The data center is located in Washington D.C. This was chosen because it seemed have the best latency of all the options between the US and Europe. Most of Feedbin's customers are in the US, but Europe is close behind, specifically the U.K. and Germany.

The Bare Metal
--------------

Feedbin is heavily I/O bound and cloud servers just were not cutting it for much of functionality so I selected physical machines for the primary servers.

**Database Server**

Postgres 9.2.4 on Ubuntu 12.04.2 LTS 64bit (with a [3.9 kernel upgrade](http://commandprompt.com/blogs/joshua_drake/2013/06/the_steaming_pile_that_is_precise_with_kernel_32))

Big thanks to [Josh Drake](http://www.commandprompt.com/blogs/joshua_drake/), Andrew Nierman and the rest of the team at [Command Prompt](http://commandprompt.com/) for setting this up. These guys do excellent (and fast) work. I wanted a top-notch, reliable and fast Postgres setup and these guys nailed it.

- Motherboard: SuperMicro X9DRI-LN4F+ Intel Xeon DualProc
- CPU: 2 x Intel Xeon Sandy Bridge E5-2620 Hex Core 2GHz
- RAM: 64GB
- Storage: 4 x [Intel S3700 Series](http://www.anandtech.com/show/6432/the-intel-ssd-dc-s3700-intels-3rd-generation-controller-analyzed) SSDSC2BA800G301 800GB in RAID 10 for about 1.6TB of usable space
- Alternate storage: 2 x Seagate Cheetah ST3600057SS (600GB) used for WAL and xlogs.

The database server is in a 6U enclosure. Check out pictures of these things, [they're monsters](http://tinyurl.com/nt7wclk).

The database has a similarly configured hot standby (using Command Prompt's [PITRtools](https://github.com/commandprompt/PITRTools)) and ships write-ahead log files to S3 constantly as well as taking a nightly base backup using Heroku's [wal-e](https://github.com/wal-e/wal-e).

**Web Servers x 3**

[Nginx](http://wiki.nginx.org/Main) in front of [Unicorn](http://unicorn.bogomips.org/) running Rails 4.0, Ruby 2.0 (using [rbenv](https://github.com/sstephenson/rbenv)) on Ubuntu 12.04.2 LTS 64bit

- Motherboard: SuperMicro X9SCI-LN4F Intel Xeon SingleProc
- CPU: Intel Xeon Ivy Bridge E3-1270 V2 Quadcore 3.5GHz 
- RAM: 8GB

**Background Workers x 2**

[Sidekiq Pro](http://sidekiq.org/pro/), Ruby 2.0 (using [rbenv](https://github.com/sstephenson/rbenv)) on Ubuntu 12.04.2 LTS 64bit

- Motherboard: SuperMicro X8SIE-LN4F Intel Xeon SingleProc
- Processor: Intel Xeon Lynnfield 3470 Quadcore 2.93GHz
- Ram: 8GB

The Cloud
---------

At Softlayer there are a handful of cloud servers as well. There are two load balancers running nginx that handle SSL termination and load balancing. Both of these get used because DNS is hosted at Route 53 which offers [Active-Active DNS Failover](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-configuring.html).

There is also a 4 GB memcached instance here.

**DigitalOcean**

All feed refreshing is done in another datacenter. In this case [DigitalOcean](https://www.digitalocean.com/) is being used. They provide low cost AND high performance virtual private servers and it's fast to turn them on or off. The refresh job gets scheduled to a 16GB instance running Redis 2.6.14. There are 10 2GB 2 core instances running Sidekiq Pro that pick jobs off the queue. The job is simple but needs to run as quickly and as parallel as possible. It makes an HTTP request with if-modified-since and if-none-match headers to take advantage of HTTP caching. Then the feed is parsed using [feedzirra](https://github.com/pauldix/feedzirra). A unique id is generated for every entry in the feed and the existence of this id is checked against the redis database.

The data structure for the ids in redis was inspired by this [Instagram blog post](http://instagram-engineering.tumblr.com/post/12202313862/storing-hundreds-of-millions-of-simple-key-value-pairs) about efficiently storing millions of key value pairs. 

A unique id for an entry is a sha1 of a few different attributes of the entry. After an entry is imported a key is added to redis like:

    HSET "entry:public_ids:e349a" "e349a4ec0bd033d81724cf9113f09b94267fe984" "1"

Using the first 5 characters in the id hash creates a nice distribution of keys per hash. For 20,000,000 ids only about 1,000,000 redis keys are created. This means it gets to take advantage of [redis hash memory efficiency](http://redis.io/topics/memory-optimization). I tried this with a few other data structures and found this to be the most efficient. For example storing the keys as a redis set took more than twice the memory.

If it is determined that an entry is new the full entry is converted to JSON and inserted back into redis as a Sidekiq job where it can get imported by a background worker running at SoftLayer.

I'd love to [hear from you](mailto:ben@feedbin.me) if you have any questions or suggestions about the architecture.