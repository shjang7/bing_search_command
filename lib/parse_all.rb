# frozen_string_literal: true
require_relative './parse_common.rb'

class ParseAll
  attr_accessor :page
  attr_reader :count, :raw_data

  IMAGE_LOCATION = 3

  def initialize(raw_data, count)
    @raw_data = raw_data
    @count = count
  end

  def result
    return text_result if count <= IMAGE_LOCATION
    datas = text_result

    datas[0...IMAGE_LOCATION] + image_result + datas[IMAGE_LOCATION..-1]
  end

  def page
    @page ||= Nokogiri::HTML(raw_data)
  end

  private

  def text_count
    count > IMAGE_LOCATION ? count - 1 : count
  end

  def text_result
    datas_list = Array.new(text_count) { {} }
    common_page = page.css('li.b_algo')
    datas_list.each_index do |i|
      datas_list[i][:title] = common_page.css('h2 a')[i].content
      datas_list[i][:link] = common_page.css('.b_caption cite')[i].content
      datas_list[i][:description] = common_page.css('.b_caption p')[i].content
    end
    datas_list
  end

  def image_result
    common_page = page.css('li.b_ans.b_mop')
    [{
      title: common_page.css('.irphead h2 a')[0].content,
      link: common_page.css('.irphead .b_attribution cite')[0].content,
      a: BASE_URL + common_page.css('.b_rich .slide a')[0]['href'],
      images: common_page.css('.b_rich .slide img')[0...count].map { |node| node['src'] }
    }]
  end
end
