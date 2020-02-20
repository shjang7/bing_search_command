# frozen_string_literal: true
require 'rubygems'
require 'nokogiri'

class Parse
  attr_accessor :raw_data, :page
  def initialize(raw_data)
    @raw_data = raw_data
  end

  def result(number)
    data_list = begin
      page.css('li h2 a')[0...number].map do |node|
        { title: node.content, link: node.attr('href') }
      end
    end
    desc = description(number)
    data_list.each_index do |i|
      next if i == 4 || i == 10 # Photo or Video search
      data_list[i][:description] = desc[convert_index(i)]
    end
    data_list
  end

  def page
    @page ||= Nokogiri::HTML(raw_data)
  end

  private

  def convert_index(i)
    j = i
    j -= 1 if i > 4
    j -= 1 if i > 10
    j
  end

  def description(number)
    number -= 1 if number >= 4
    number -= 1 if number >= 10
    page.css('li p')[0...number].map do |node|
      node.content
    end
  end
end
