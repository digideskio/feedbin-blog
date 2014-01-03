---
layout: post
title: Sending Safari Push Notifications with Rails
author: Ben Ubois
---

Mac OS X Mavericks has a feature that allows websites to send desktop push notifications.

Apple has a [page with resources and documentation](https://developer.apple.com/notifications/safari-push-notifications/) about how to set this up.

Here's how Feedbin uses this with Rails 4.

Getting Started
---------------

To get started you will need an Apple Developer account enrolled in either the iOS or Mac OS X program.

Once you get that you need to generate a certificate. Follow the [steps from Apple](https://developer.apple.com/library/mac/documentation/NetworkingInternet/Conceptual/NotificationProgrammingGuideForWebsites/PushNotifications/PushNotifications.html#//apple_ref/doc/uid/TP40013225-CH3-SW33) to get your certificate.

Once you have the certificate, you'll need to convert it to a `p12` file.

To do this open the certificate in `Keychain.app`, right click on the certificate and choose `Export`. You can keep this file in your Rails project somewhere like `lib/apple_push_certificate.p12`.

Rails Setup
-----------

Most of the actual work is done by two gems. The first is [`grocer-pushpackager`](https://github.com/grocer/grocer-pushpackager). To authorize your website Apple requires a "push package" which is just a zip file that contains information about your website, the icons you would like to display and a signature file to authenticate the notifications. `grocer-pushpackager` makes it much easier to generate this file in Ruby.

The other gem is [`grocer`](https://github.com/grocer/grocer). `grocer` handles sending the push notifications.

There is an [issue](https://github.com/grocer/grocer-pushpackager/pull/1) with `grocer-pushpackager` which is the gem from [rubygems.org](http://rubygems.org) doesn't actually work. Feedbin uses a fork of the gem that fixes the issue, so I'm specifying a GitHub source:

`Gemfile`

{% highlight ruby %}
source 'https://rubygems.org'
gem 'grocer-pushpackager',   github: 'feedbin/grocer-pushpackager', ref: 'e190796', require: 'grocer/pushpackager'
gem 'grocer'
{% endhighlight %}

Next up you need a four routes that Apple can make requests to for creating, updating, deleting push authorizations and finally one that it can send errors to.

These map nicely to Rails routes.

`routes.rb`

{% highlight ruby %}
# When a user allows permission to receive push notifications
post 'apple_push_notifications/:version/pushPackages/:website_push_id', as: :apple_push_notifications_package, to: 'apple_push_notifications#create', website_push_id: /.*/

# POST When users first grant permission, or later change their permission
# levels for your website
post 'apple_push_notifications/:version/devices/:device_token/registrations/:website_push_id', as: :apple_push_notifications_update, to: 'apple_push_notifications#update', website_push_id: /.*/

# DELETE If a user removes permission of a website in Safari preferences, a
# DELETE request is sent
delete 'apple_push_notifications/:version/devices/:device_token/registrations/:website_push_id', as: :apple_push_notifications_delete, to: 'apple_push_notifications#delete', website_push_id: /.*/

# Error log
post 'apple_push_notifications/:version/log', as: :apple_push_notifications_log, to: 'apple_push_notifications#log'
{% endhighlight %}

The `:website_push_id` can contain periods and other characters that Rails considers significant so it's important to specify a regex that allows these characters in this segment.

All of these routes specify the controller `