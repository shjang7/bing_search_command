# frozen_string_literal: true
require 'rest-client'
require './lib/search.rb';
require './lib/parse.rb';

def main
  if ARGV.empty?
    abort('This program requires a search phrase as a commandline argument')
  else
    client = Search.new(ARGV)
    begin
      res = client.search
    rescue RestClient::ExceptionWithResponse => e
      puts ("#{e}")
    end
  end

  unless res.nil?
    searched_data = Parse.new(res)
    print "#{searched_data[:title]} \n"
    print "[LINK] #{searched_data[:link]} \n"
    print "[DESCRIPTION] #{searched_data[:description]} \n"
  end
end
