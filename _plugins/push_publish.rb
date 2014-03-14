require 'net/http'

module Jekyll
  class PushPublish < Generator
    safe true

    def generate(site)
      uri = URI('http://pubsubhubbub.superfeedr.com/')
      Net::HTTP.post_form(uri,
        'hub.mode' => "publish",
        'hub.url' => 'http://blog.feedbin.com/atom.xml'
      )
    end

  end
end