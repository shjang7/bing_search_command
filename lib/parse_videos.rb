# frozen_string_literal: true
require_relative './parse_common.rb'

class ParseVideos
  attr_accessor :page
  attr_reader :count, :raw_data

  def initialize(raw_data, count)
    @raw_data = raw_data
    @count = count
  end

  def result
    datas_list = Array.new(count) { {} }

    common_page = page.css('body #b_content .resultContainer')
    datas_list.each_index do |i|
      datas_list[i][:link] = common_page.css('.meta-row-1 a')[i]['href']
      datas_list[i][:image] = common_page.css('.meta-row-1 .duration')[i].content
      datas_list[i][:title] = common_page.css('.cico a')[i]['title']
    end
    datas_list
  end

  def page
    @page ||= Nokogiri::HTML(raw_data)
  end
end
