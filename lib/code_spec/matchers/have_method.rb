# This method tries to see if a specific method is contained in the generated file.
# It can operate (should) on either a file name or the raw content 
#
#   generated_file_name.should have_method "hello" # 'my/path/say_hello.rb'.should have_method "hello"
#
#   say_hello_file_content.should have_method "hello"
#
module RSpec::RubyContentMatchers
  class HaveMethod < RSpec::RubyContentMatcher
    attr_reader :method, :type, :args

    def initialize(method, type=nil, options = {})
      @method = method.to_s
      super method
      @type = type      
      @args = options[:args]
    end

    def index
      1
    end          
  
    def failure_message
      super
      display "Expected there to be the #{class_msg} method #{method}, but there wasn't"
    end 
    
    def negative_failure_message                                      
      super
      display "Did not expect there to be the #{class_msg} method #{method}, but there was"
    end

    protected

    def class_msg
      (type == :class) ? 'class' : ''
    end

    def main_expr
      'def' + SPACES + "#{self_expr}#{method}#{args_expr}" + ANY_GROUP
    end

    def args_expr
      return super if args
      any_args_expr
    end
       
    def self_expr 
      type == :class ? 'self.' : ''
    end
            
    def alt_end
      'def'
    end
  end
  
  def have_method(method, type = nil)
    HaveMethod.new(method, type)
  end  

  def have_class_method(method)
    have_method method, :class
  end  

  def have_args_method(method, options = {})
    have_method method, options[:type], options
  end  

end
