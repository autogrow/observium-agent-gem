module Observium
  module Agent
    class Parser
      attr_reader :sections

      def initialize(text)
        @text = text

        validate!
        preprocess
      end

      def section(title, postprocess=true)
        return {} unless has_section?(title)
        
        index = @lines.index("<<<#{title}>>>")

        array = []
        @lines[(index+1)..@lines.size].each do |line|
          break if line.include? "<<<"
          array << line
        end

        return array.join("\n") unless postprocess

        hash = Hash.new
        array.each do |line|
          if m = line.match(/^(\S+)=(.*)$/)
            hash[ symbolize_field( m[1] ) ] = m[2]
          end
        end

        hash
      end

      def has_section?(title)
        @sections.include? title
      end

      def symbolize_field(field)
        field.downcase!
        field.tr! "-", "_"
        field.to_sym
      end

      private

      def validate!
        valid_text? or raise Errors::ParsingFailed, "Invalid text passed to the parser"
      end

      def valid_text?
        !@text.nil? and
        !@text.strip.empty? and
        !@text.lines.count.zero? and
        @text.lines.count != 1
      end

      def preprocess
        @lines = @text.split("\n")
        @sections = @text.scan(/<<<([^>]*)>>>/).map {|s| s.first }
      end
    end
  end
end