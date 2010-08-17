module RSpec::RubyContentMatchers
  class MatchLines
    attr_accessor :lines, :separator

    def initialize *lines       
      lines = lines.flatten
      last_arg = lines.last
      separator = case last_arg
      when Hash 
        self.lines = lines[0..-2].flatten                
        last_arg[:separator]        
      else 
        self.lines = lines        
        "\n"
      end      
      self.separator = separator
    end

    def matches?(content, &block)
      lines.each do |txt|  
        txt.split(separator).each do |line|
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
