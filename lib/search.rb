# frozen_string_literal: true
require 'rest-client';

class Search
  attr_reader :search_term, :data, :search_type
  attr_accessor :uri

  BASE_URL = 'https://www.bing.com/'

  def initialize(search_term, search_type)
    @search_term = search_term
    @search_type = search_type
  end

  def data
    RestClient.get(uri)
  end

  def uri
    @uri ||= "#{BASE_URL}#{type_of_search}search?q=#{search_term}"
  end

  def type_of_search
    case search_type
    when 1
      ''
    when 2
      'images/'
    when 3
      'videos/'
    end
  end
end
