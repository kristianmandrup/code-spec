module RSpec::RubyContentMatchers
  class InheritFrom < RSpec::RubyContentMatcher
    attr_reader :klass

    def initialize klass
      @klass = klass.to_s.camelize
      super @klass
    end

    def index
      1
    end
  
    def failure_message
      super
      "Expected the class to inherit from #{klass}"
    end 
    
    def negative_failure_message
      super
      "Did not expect the class to inherit from #{klass}"
    end
    
    protected

    def main_expr
      'class' + SPACES + Q_ANY_GROUP + '<' + OPT_SPACES + "#{klass}" + ANY_GROUP
    end
  end
  
  def inherit_from(klass)
    InheritFrom.new(klass)
  end 
  alias_method :be_subclass_of, :inherit_from    
end  
