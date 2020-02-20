# frozen_string_literal: true

class Search
  attr_reader :search_term
  attr_accessor :uri

  BASE_URL = 'https://api.collection.cooperhewitt.org/rest/'

  def initialize(search_term)
    @search_term = search_term
  end
end
