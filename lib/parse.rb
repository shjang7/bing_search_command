# frozen_string_literal: true
require 'rubygems'
require 'nokogiri'

class Parse
  attr_accessor :raw_data, :page

  def initialize(raw_data)
    @raw_data = raw_data
  end

  def result(number)
    data_list = title(number)
    desc = description(number)
    data_list.each_index do |i|
      data_list[i][:description] = desc[i]
    end
    data_list
  end

  def page
    @page ||= Nokogiri::HTML(raw_data)
  end

  private

  def title(number)
    page.css('li h2 a')[0...number].map do |node|
      { title: node.content, link: node.attr('href') }
    end
  end

  def description(number)
    page.css('li p')[0...number].map do |node|
      node.content
    end
  end
end
