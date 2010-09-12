module RSpec::RubyContentMatchers
  class HaveComment < RSpec::RubyContentMatcher
    attr_accessor :comment

    def initialize comment
      @comment = comment
    end

    def matches?(content)
      @content = content                        
      (content =~ /#{main_expr}/)
    end
  
    def failure_message
      super
      "Expected there to be the comment '# #{comment}'" 
    end 
    
    def negative_failure_message
      super
      "Did not expect there to be the comment '# #{comment}'" 
    end

    protected
    
    def main_expr
      '\s*#\s*' + "#{comment}"
    end
  end

  def have_comment comment
    HaveComment.new comment
  end
  
end
