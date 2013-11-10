---
layout: post
title: Powering Actions with Elasticsearch Percolate
author: Ben Ubois
author_link: https://twitter.com/bsaid
---

[Actions](/2013/11/06/actions-workflows-for-your-rss-feeds/) are built on a great feature of [elasticsearch](http://www.elasticsearch.org/) called [percolate](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/search-percolate.html).

Percolate allows you to register queries ahead of time, then whenever you send a new document to be indexed, elasticsearch can tell you if this document matches any saved queries.

Here's how it works.

Feedbin is a Rails app and uses the [tire](https://github.com/karmi/retire) gem for working with elasticsearch.

Whenever an action is added or updated, it is also sent to elasticsearch as a percolator query.

{% highlight ruby %}
Entry.index.register_percolator_query(3) do
  string "kittens"
end
{% endhighlight %}

The `3` is the id of this action. This is used later on to find what user this action belongs to and which actions should be performed.

A model called `Entry` is used for storing RSS articles. Whenever a new entry is added it also gets sent to elasticsearch for indexing.

{% highlight ruby %}
class Entry < ActiveRecord::Base
  include Tire::Model::Search
  after_commit :search_index_store, on: :create

  private

  def search_index_store
    result = self.index.store(self, {percolate: true})
    ActionsPerform.perform_async(self.id, result['matches'])
  end

end
{% endhighlight %}

An array of matched actions ids is returned in `result['matches']`. So if this entry mentions "kittens" an array like `["3"]` would be returned.

Feedbin uses [Sidekiq](http://sidekiq.org/) to process background jobs. The `ActionsPerform.perform_async` part is creating a new background job that performs the actions. A simplified version of this looks like:

{% highlight ruby %}
class ActionsPerform
  include Sidekiq::Worker

  def perform(entry_id, action_ids)
    actions = Action.where(id: action_ids)
    actions.each do action
      if action.actions.include?("send_push_notification")
        PushNotificationSend.perform_async(entry_id, user_ids)
      end
    end
  end

end
{% endhighlight %}

[Get in touch](https://twitter.com/feedbin) if you have any questions about this or [sign up to see it in action](https://feedbin.me).

[Discuss this on Hacker News](https://news.ycombinator.com/item?id=6708446).