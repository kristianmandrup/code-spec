module RSpec::RubyContentMatchers
  class HaveModule < RSpec::RubyContentMatcher
    attr_reader :name, :type, :postfix

    def initialize(name, postfix=nil)
      @name = name.to_s.camelize
      super @name
      @postfix = postfix.to_s.camelize if postfix
      @type = :module
    end
  
    def failure_message
      super
      display "Expected there to be the #{type} #{name}"
    end 
    
    def negative_failure_message
      super
      display "Did not expected there to be the #{type} #{name}"
    end

    protected
    
    def main_expr
      "#{type}" + SPACES + "#{name}#{postfix}" + SPACES + ANY_GROUP
    end
    
    def alt_end
      type
    end
  end

  class HaveClass < HaveModule

    def initialize(name, postfix) 
      super name, postfix
      @type = :class
    end    
  end
  
  def have_module(module_name, postfix=nil)
    HaveModule.new(module_name, postfix)
  end       
  alias_method :be_module, :have_module  
  
  def have_class(klass, postfix = nil)
    HaveClass.new(klass, postfix)
  end    
  alias_method :be_class, :have_class  
end  
