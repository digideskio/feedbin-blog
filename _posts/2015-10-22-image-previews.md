---
layout: post
title:  Image Previews
author: Ben Ubois
---

Feedbin now features image previews in the center column.

<figure>
	<a href="{{ 'images/2015-10-22/screenshot_one_large.jpg' | asset_path }}">
        <img src="{{ 'images/2015-10-22/screenshot_one_small.jpg' | asset_path }}" />
    </a>
	<figcaption>Feedbin, now with more images.</figcaption>
</figure>

The most important thing to me when building this feature was that only images that are reasonably high quality would show up here. To do this Feedbin uses a set of criteria that an image must meet in order to be chosen.

Feedbin can find a variety of images including:

- Images in the RSS post
- Poster frames from YouTube and Vimeo embeds
- [Open Graph](http://ogp.me/) and [Twitter Card](https://dev.twitter.com/cards/overview) meta data

One of my favorite operations that Feedbin does to ensure the quality of these image previews is facial detection using [OpenCV](http://opencv.org/). By getting a rough idea about where faces in an image might be, Feedbin is able to get a better crop. I first saw this idea used in [Twitterrific](http://blog.iconfactory.com/2015/06/twitterrifics-new-facial-recognition-keeps-faces-front-center/) and loved the results.

<figure>
    <img src="{{ 'images/2015-10-22/crop_smart.jpg' | asset_path }}" />
    <figcaption>Crop with face detection. Sample image from <a href="https://thegreatdiscontent.com/interview/jim-riswold">The Great Discontent</a>.</figcaption>
</figure>

<figure>
    <img src="{{ 'images/2015-10-22/crop_naive.jpg' | asset_path }}" />
    <figcaption>Crop without face detection. Sample image from <a href="https://thegreatdiscontent.com/interview/jim-riswold">The Great Discontent</a>.</figcaption>
</figure>

Adding images is a big visual change and if you prefer the old look you can turn off image previews in the [Appearance settings](https://feedbin.com/settings/appearance).