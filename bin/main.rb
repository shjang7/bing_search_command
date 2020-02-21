# frozen_string_literal: true
require 'rest-client'
require File.expand_path('../lib/search.rb');
require File.expand_path('../lib/parse_all.rb');

class Main
  attr_accessor :raw_data, :search_type, :search_count, :search_keyword, :argv

  def initialize(argv)
    @argv = argv
  end

  def execution
    return if exception_argv()

    set_search_factor()
    search_execution()

    unless raw_data.nil?
      parsed_data_print()
    end
  end

  private

  def search_execution
    search = Search.new(search_keyword, search_type)
    begin
      @raw_data = search.data
    rescue RestClient::ExceptionWithResponse => e
      puts e
    end
  end

  def parsed_data_print
    parsed_data = ParseAll.new(raw_data, search_count)
    searched_results = parsed_data.result()
    print "search \"#{search_keyword}\": \n\n"
    
    searched_results.each_with_index do |result, i|
      puts "##{i+1}"
      result[:images] ? print_image(result) : print_text(result)
      print "\n"
    end
  end

  def print_all_caption(result)
    puts "#{result[:title]}"
    puts "#{result[:link]}"
  end

  def print_text(result)
    print_all_caption(result)
    puts "#{result[:description]}"
  end

  def print_image(result)
    print_all_caption(result)
    puts "#{result[:a]}"
    result[:images].each do |src|
      puts "#{src}"
    end
  end

  def exception_argv
    if argv.empty?
      abort('This program requires a search phrase as a commandline argument'); return true
    elsif argv[-1].to_i == 0
      abort('This program requires a search count as a last argument'); return true
    elsif argv.length < 3
      abort('This program requires a search type as a second last argument'); return true
    end
    false
  end

  def set_search_factor
    @search_count = argv[-1].to_i
    @search_type = argv[-2]
    @search_keyword = argv[0..-3]
  end
end

Main.new(ARGV).execution()
