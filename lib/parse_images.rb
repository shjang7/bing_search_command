# frozen_string_literal: true
require_relative './parse.rb'

class ParseImages < Parse
  def initialize(raw_data, count)
    super
  end

  def result
    datas_list = Array.new(count) { {} }

    common_page = page.css('body #b_content .item a.thumb')
    datas_list.each_index do |i|
      datas_list[i][:link] = common_page[i]['href']
      datas_list[i][:image] = common_page.css('img')[i]['src']
    end
    datas_list
  end
end
