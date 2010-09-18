module RSpec::RubyContentMatchers
  class HaveSubClasses < HaveModules
    attr_reader :superclass, :klass, :full_class

    def initialize *names 
      superclass = last_arg_value({:superclass => ''}, names) 
      @superclass = superclass ? superclass.to_s.camelize : nil
      super *names
      @type = :class
    end            
    
    def main_expr      
      if superclass
        'class' + SPACES + "#{full_class}" + OPT_SPACES + '<' + OPT_SPACES + "#{superclass}" + ANY_GROUP
      else
        super
      end
    end
    
    def failure_message  
      super
      "Expected there to be the subclass #{full_class} of #{superclass}"
    end 

    def negative_failure_message
      super
      "Did no expected there to be the subclass #{full_class} of #{superclass}"
    end    
  end

  # can take :postfix and :superclass hash args  
  def have_subclasses *names
    HaveSubClasses.new *names
  end    
end
