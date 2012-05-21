#!/usr/bin/env ruby
require 'nokogiri'
require 'open-uri'
# The main XKCD driver
class XKCD
    # Get img/comic URL from xkcd
    #
    # Example:
    #   >> XKCD.img
    #   => "http://imgs.xkcd.com/comics/hell.png" 
    #
    #   >> XKCD.comic
    #   => "http://xkcd.com/891/"

    def self.comic
        open('http://dynamic.xkcd.com/random/comic/').base_uri.to_s
    end
    
    class << XKCD
        alias_method :get, :comic
    end
      
    def self.img
        img = Nokogiri::HTML(open('http://dynamic.xkcd.com/random/comic/')).css('#comic img')[0]
        img_url = img.attributes["src"].value
        img_title = img.attributes["title"].value
        "#{img_title} : #{img_url}"
    end
end
