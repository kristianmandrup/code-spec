module CodeSpec
  module Erb
    class << self
      attr_accessor :debug

      def debug?
        debug
      end
    end
    
    def self.get_code code
      puts code if debug?
      erb = code.scan(/<%-?=?\s*(.*?)\s*-?%>/).flatten.join "\n"
      puts erb if debug?
      erb
    end
  end
end

class String
  def erb_code code  
    CodeSpec::Erb.get_code code
  end
end

class File
  def erb_code  
    CodeSpec::Erb.get_code File.read(self)
  end
end
    