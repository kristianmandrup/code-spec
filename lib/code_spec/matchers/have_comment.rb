# This method tries to see if a specific method is contained in the generated file.
# It can operate (should) on either a file name or the raw content 
#
#   generated_file_name.should have_method "hello" # 'my/path/say_hello.rb'.should have_method "hello"
#
#   say_hello_file_content.should have_method "hello"
#
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
