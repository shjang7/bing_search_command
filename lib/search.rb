# frozen_string_literal: true
require 'rest-client';
require_relative './variables.rb'

class Search
  attr_reader :search_term, :data, :search_type
  attr_accessor :uri

  def initialize(search_term, search_type)
    @search_term = search_term
    @search_type = search_type
  end

  def data
    RestClient.get(uri)
  end

  def uri
    print "#{BASE_URL}#{type_of_search}search?q=#{search_term} \n"
    @uri ||= "#{BASE_URL}#{type_of_search}search?q=#{search_term}"
  end

  def type_of_search
    case search_type
    when 'images', 'videos'
      "#{search_type}/"
    else
      ''
    end
  end
end
