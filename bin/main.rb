# frozen_string_literal: true
require 'rest-client'
require File.expand_path('../lib/search.rb');
require File.expand_path('../lib/parse.rb');

def main
  if ARGV.empty?
    abort('This program requires a search phrase as a commandline argument')
    return
  end

  search_keyword = ARGV
  puts 'How many search result do you want?'
  number = STDIN.gets.chomp.to_i
  puts 'Would you like to search 1: all, 2: images, 3:videos ?'
  search_type = STDIN.gets.chomp.to_i

  raw_data = nil
  unless search_keyword.nil?
    search = Search.new(search_keyword, search_type)
    begin
      raw_data = search.data
    rescue RestClient::ExceptionWithResponse => e
      puts e
    end
  end

  unless raw_data.nil?
    parsed_data = Parse.new(raw_data, number)
    searched_results = parsed_data.result()
    searched_results.each_with_index do |result, i|
      print "##{i+1} \n"
      print "#{result[:title]} \n"
      print "#{result[:link]} \n"
      if result[:images]
        print "#{result[:a]} \n"
        result[:images].each do |src|
          print "#{src} \n"
        end
      else
        print "#{result[:description]} \n"
      end
      print "\n"
    end
  end
end

main
