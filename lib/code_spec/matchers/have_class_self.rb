# This method tries to see if a specific method is contained in the generated file.
# It can operate (should) on either a file name or the raw content 
#
#   generated_file_name.should have_method "hello" # 'my/path/say_hello.rb'.should have_method "hello"
#
#   say_hello_file_content.should have_method "hello"
#
module RSpec::RubyContentMatchers
  class HaveClassSelf < RSpec::RubyContentMatcher

    def initialize
      @end_option = 'class'
    end
  
    def failure_message
      super
      return "Expected there to be a: class << self"
    end 
    
    def negative_failure_message
      super
      "Did not expect there to be a: class << self"
    end

    protected
    
    def main_expr
      'class\s*<<\s*self' + ANY_GROUP
    end

    def alt_end
      'class self'
    end             
  end

  def have_class_self
    HaveClassSelf.new
  end
  
end
