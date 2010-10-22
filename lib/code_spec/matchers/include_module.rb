module RSpec::RubyContentMatchers
  class IncludeModule < RSpec::RubyContentMatcher
    attr_reader :module_name, :type

    def initialize module_name, type=nil
      @module_name = module_name.to_s.camelize
      @type = type || :include
    end

    def matches?(content)      
      @content = content
      (content =~ /#{type}\s+#{module_name}/)
    end          
  
    def failure_message
      super
      display "Expected there to be an inclusion of module #{module_name}"
    end 
    
    def negative_failure_message
      super
      display "Did not expect there to be an inclusion of module #{module_name}"
    end
               
  end
  
  def include_module(module_name)
    IncludeModule.new(module_name)
  end    

  def extend_module(module_name)
    IncludeModule.new(module_name, :extend)
  end
end  
