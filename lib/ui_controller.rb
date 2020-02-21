# frozen_string_literal: true
require_relative './parse_images.rb'
require_relative './parse_videos.rb'
require_relative './parse_all.rb'

module UiController
  class << self
    def print_title(word)
      print "search \"#{word}\": \n"
    end

    def print_count_over(list_count, max_count, type)
      print list_count > max_count ? "\nThe #{type} results can be showing only #{max_count} \n" : ""
    end

    def print_for_images(raw_data, search_count)
      parsed_data = ParseImages.new(raw_data, [search_count, IMAGE_SEARCH_MAX].min)
      parsed_data.result().each_with_index do |result, i|
        puts "\n##{i+1}", "#{result[:link]}", "#{result[:image]}"
      end
      print_count_over(search_count, IMAGE_SEARCH_MAX, 'images')
    end

    def print_for_videos(raw_data, search_count)
      parsed_data = ParseVideos.new(raw_data, [search_count, VIDEO_SEARCH_MAX].min)
      parsed_data.result().each_with_index do |result, i|
        puts "\n##{i+1}", "#{result[:link]}", "#{result[:image]}", "#{result[:title]}", "#{result[:description]}"
      end
      print_count_over(search_count, VIDEO_SEARCH_MAX, 'videos')
    end

    def print_for_all(raw_data, search_count)
      parsed_data = ParseAll.new(raw_data, [search_count, ALL_SEARCH_MAX].min)
      parsed_data.result().each_with_index do |result, i|
        puts "\n##{i+1}", "#{result[:title]}", "#{result[:link]}"
        result[:images] ? begin
          puts "#{result[:a]}", result[:images].each { |src| puts "#{src}" }
        end : begin puts "#{result[:description]}" end
      end
      print_count_over(search_count, ALL_SEARCH_MAX, 'all')
    end

    private

    ALL_SEARCH_MAX = 11
    IMAGE_SEARCH_MAX = 19
    VIDEO_SEARCH_MAX = 12
  end
end
