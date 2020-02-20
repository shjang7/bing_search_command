# frozen_string_literal: true
require 'rest-client';

class Search
  attr_reader :search_term, :data
  attr_accessor :uri

  BASE_URL = 'https://www.bing.com/'

  def initialize(search_term)
    @search_term = search_term
  end

  def data
    RestClient.get(uri)
  end

  def uri
    @uri ||= "#{BASE_URL}search?q=#{search_term}"
  end
end
