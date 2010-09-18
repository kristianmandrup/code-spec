# This method tries to see if a specific method is contained in the generated file.
# It can operate (should) on either a file name or the raw content 
#
#   generated_file_name.should have_method "hello" # 'my/path/say_hello.rb'.should have_method "hello"
#
#   say_hello_file_content.should have_method "hello"
#
module RSpec::RubyContentMatchers
  class HaveMethods < RSpec::RubyContentMatcher
    attr_reader :method, :type, :args, :names

    def initialize *methods
      options = last_option methods
      @names = methods.to_strings
      @type = options[:type]
      @args = options[:args]
    end

    def matches? content, &block
      return false if names.empty?

      @content = content
      names.each do |name|       
        @method = name     
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

    def index
      1
    end          
  
    def failure_message
      super
      "Expected there to be the #{class_msg} method #{method}, but there wasn't"
    end 
    
    def negative_failure_message                                      
      super
      "Did not expect there to be the #{class_msg} method #{method}, but there was"
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
  
  def have_methods *methods
    HaveMethods.new methods
  end  

  def have_class_methods *methods
    have_methods *methods, :type => :class
  end
end
