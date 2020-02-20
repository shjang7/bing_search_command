# frozen_string_literal: true
require 'rest-client'
require File.expand_path('../lib/search.rb');
require File.expand_path('../lib/parse.rb');

def main
  if ARGV.empty?
    abort('This program requires a search phrase as a commandline argument')
  else
    client = Search.new(ARGV)
    begin
      res = client.data
    rescue RestClient::ExceptionWithResponse => e
      puts ("#{e}")
    end
  end

  unless res.nil?
    puts 'How many do you want?'
    number = STDIN.gets.chomp.to_i
    parsed_data = Parse.new(res)
    searched_results = parsed_data.result(number)
    searched_results.each_with_index do |result, i|
      print "##{i+1} \n"
      print "#{result[:title]} \n"
      print "#{result[:link]} \n"
      print "#{result[:description]} \n\n"
    end
  end
end

main
