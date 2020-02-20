# frozen_string_literal: true
require 'rest-client';
require 'json';
require './config/app_environment_variables.rb';

class Search
  attr_reader :search_term, :data

  BASE_URL = 'https://api.collection.cooperhewitt.org/rest/'
  S_METHOD = 'cooperhewitt.search.collection'
  S_TYPE = 'medium'
  S_ACCESS_TOKEN = ENV['COOPER_HEWITT_ACCESS_TOKEN']

  def initialize(search_term)
    @search_term = search_term
  end

  def data
    JSON.parse RestClient.get(uri)
  end

  private

  def uri
    @uri ||= "#{BASE_URL}#{search_query}"
  end

  def search_query
    "?method=#{S_METHOD}&access_token=#{S_ACCESS_TOKEN}&#{S_TYPE}=#{search_term}&page=1&per_page=100"
  end
end
