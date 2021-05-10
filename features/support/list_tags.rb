require 'cucumber/formatter/console'
require 'cucumber/formatter/io'

module Cucumber
  module Formatter
    class ListTags
      include Io
      include Console

      def initialize(path_or_io)
        @io = ensure_io(path_or_io, 'list_tags')
        @all_tags = []
      end

      def tag_name(tag_name)
        @all_tags << tag_name
      end

      def after_features
        @all_tags.uniq.sort.each {|tag| @io.puts tag}
      end
    end
  end
end