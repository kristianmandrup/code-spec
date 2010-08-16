module RSpec::RubyContentMatchers
  class MatchLines
    attr_accessor :lines

    def initialize *lines
      self.lines = lines.flatten
    end

    def matches?(content, &block)
      lines.each do |txt|
        txt.split("\n").each do |line|
          return nil if !(content =~ /#{Regexp.escape(line)}/)
        end
      end
      true
    end
  
    def failure_message
      "Expected the string to match the lines" 
    end 
    
    def negative_failure_message
      super
      "Did not expect string to match the lines" 
    end
  end
  
  def match_lines *lines
    MatchLines.new lines
  end  
end
