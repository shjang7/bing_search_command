# frozen_string_literal: true
require_relative './parse.rb'

class ParseVideos < Parse
  def initialize(raw_data, count)
    super
  end

  def result
    datas_list = Array.new(count) { {} }

    common_page = page.css('body #b_content .resultContainer')
    datas_list.each_index do |i|
      datas_list[i][:link] = common_page.css('.meta-row-1 a')[i]['href']
      datas_list[i][:title] = common_page.css('.title a span')[i]['title']
      datas_list[i][:duration] = common_page.css('.meta-row-1 a .duration')[i].content
      datas_list[i][:views] = common_page.css('.meta-row-2')[i].css('span')[1].content
    end
    datas_list
  end
end
