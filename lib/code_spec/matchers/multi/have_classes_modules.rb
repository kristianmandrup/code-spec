module RSpec::RubyContentMatchers
  class HaveModules < RSpec::RubyContentMatcher
    attr_reader :name, :names, :type, :postfix

    def initialize(*names)
      postfix = last_arg_value {:postfix => ''}, names
      @names = names.to_strings  
      @postfix = postfix.to_s.camelize if postfix
      @type = :module
    end

    def matches? content, &block
      return false if names.empty?

      @content = content

      names.each do |name|       
        @name = name     
        @end_option = name        
        match = is_match? content
        return false if !match
      end
      true
    end

    def is_match? content
      expr = get_expr(content) 
      debug "match expression: #{expr}"
      match = (content =~ expr)
      @content_matches = [$1, $2, $3]
      match
    end
  
    def failure_message
      super
      "Expected there to be the #{type} #{name}"
    end 
    
    def negative_failure_message
      super
      "Did not expected there to be the #{type} #{name}"
    end

    protected
    
    def main_expr
      "#{type}" + SPACES + "#{name}#{postfix}" + SPACES + ANY_GROUP
    end
    
    def alt_end
      type
    end
  end

  class HaveClasses < HaveModules

    def initialize *names 
      super *names
      @type = :class
    end            
  end

  # can take :postfix hash arg
  def have_modules *names
    HaveModules.new names
  end       

  # can take :postfix hash arg  
  def have_classes *names
    HaveClasses.new *names
  end    
  
end  
