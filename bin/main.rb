# frozen_string_literal: true
require 'rest-client'
require_relative '../lib/search.rb'
require_relative '../lib/ui_controller.rb'

class BingSearch
  attr_accessor :raw_data, :search_type, :search_count, :search_keywords
  attr_reader :argv

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
    search = Search.new(search_keywords, search_type)
    begin
      @raw_data = search.data
    rescue RestClient::ExceptionWithResponse => e
      puts e
    end
  end

  def parsed_data_print
    UiController.print_title(search_keywords.join(' '))
    case search_type
    when 'images'
      UiController.print_for_images(raw_data, search_count)
    when 'videos'
      UiController.print_for_videos(raw_data, search_count)
    else
      UiController.print_for_all(raw_data, search_count)
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
    @search_keywords = argv[0..-3]
  end
end

BingSearch.new(ARGV).execution()
