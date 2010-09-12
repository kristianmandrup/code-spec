module RSpec::RubyContentMatchers
  class HaveSubclass < RSpec::RubyContentMatcher
    attr_reader :klass, :superclass, :type, :full_class

    def initialize(klass, superclass, type=nil)
      @klass      = klass.to_s.camelize              
      super @klass
      @superclass = superclass.to_s.camelize
      @type       = type.to_s.camelize if type
      @full_class = "#{@klass}#{@type}"
    end

    def failure_message  
      super
      "Expected there to be the subclass #{full_class} of #{superclass}"
    end 

    def negative_failure_message
      super
      "Did no expected there to be the subclass #{full_class} of #{superclass}"
    end   

    protected 
    
    def main_expr
      'class' + SPACES + "#{klass}#{type}" + OPT_SPACES + '<' + OPT_SPACES + "#{superclass}" + ANY_GROUP      
    end

    def alt_end
      'class'
    end
    
  end

  def have_subclass(klass, superclass, type=nil)
    HaveSubclass.new(klass, superclass, type)
  end    
  alias_method :be_subclass, :have_subclass  
end