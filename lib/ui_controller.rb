require_relative './parse_images.rb'
require_relative './parse_all.rb'

module UiController
  class << self
    def print_title(word)
      print "search \"#{word}\": \n"
    end

    def print_for_images(raw_data, search_count)
      parsed_data = ParseImages.new(raw_data, search_count)
      parsed_data.result().each_with_index do |result, i|
        puts "\n##{i+1}", "#{result[:link]}", "#{result[:image]}"
      end
    end

    def print_for_all(raw_data, search_count)
      parsed_data = ParseAll.new(raw_data, search_count)
      parsed_data.result().each_with_index do |result, i|
        puts "\n##{i+1}", "#{result[:title]}", "#{result[:link]}"
        result[:images] ? begin
          puts "#{result[:a]}", result[:images].each { |src| puts "#{src}" }
        end : begin puts "#{result[:description]}" end
      end
    end
  end
end
