require 'rubygems'
require 'net/http'
require 'json'

require File.join(File.dirname(__FILE__), 'chat')
require File.join(File.dirname(__FILE__), 'client')
require File.join(File.dirname(__FILE__), 'user')
module JavaEye
  URL = {:auth =>"http://api.javaeye.com/api/auth/verify",
    :list => "http://api.javaeye.com/api/twitters/list",
    :reply => 'http://api.javaeye.com/api/twitters/replies',
    :all => 'http://api.javaeye.com/api/twitters/all',
    :create => "http://api.javaeye.com/api/twitters/create",
    :delete => "http://api.javaeye.com/api/twitters/destroy",
    :show => "http://api.javaeye.com/api/twitters/show"}
    COUNT_MAX = 140
    VIA = "javaeye4r"

    def self.option2query(option)
      query = ''
      option.each do |key,value|
        query << (key.to_s + '=' + value.to_s + '&')
      end
      query.chop
    end

    def self.get_request_uri(path,option)
      query = option2query(option)
      if query.empty?
        path
      else
        path + '?' + query
      end
    end

  end