require 'rubygems'
require 'nokogiri'
require_relative './variables'

class Parse
  attr_accessor :page
  attr_reader :count, :raw_data

  def initialize(raw_data, count)
    @raw_data = raw_data
    @count = count
  end

  def page
    @page ||= Nokogiri::HTML(raw_data)
  end
end
