module Erb
  module Code
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
  def erb_code  
    Erb::Code.get_code self
  end
end

class File
  def erb_code  
    Erb::Code.get_code File.read(self)
  end
end
    