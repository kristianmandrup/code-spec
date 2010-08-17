# This method tries to see if a specific method is contained in the generated file.
# It can operate (should) on either a file name or the raw content 
#
#   generated_file_name.should have_method "hello" # 'my/path/say_hello.rb'.should have_method "hello"
#
#   say_hello_file_content.should have_method "hello"
#
module RSpec::RubyContentMatchers
  class HaveCall < RSpec::RubyContentMatcher
    attr_reader :method, :args, :dot, :content

    def initialize(method, options = {})
      @method = method.to_s
      @args = case options
      when Hash 
        options[:args] 
      else 
        options
      end
      @dot = options[:dot]
    end

    def matches?(content)
      @content = content 
      has_def = (content =~ /def(.*)#{method}/)
      expr = if has_def || dot == :form
        /#{dot_expr}#{method}#{args_expr}/m        
      else
        /#{dot_expr}?#{method}#{args_expr}/m
      end   
      debug "expr = #{expr}"
      debug "content = %{#{content}}"
      debug "content =~ #{expr}"      
      (content =~ expr)
    end          
  
    def failure_message
      super
      "Expected there to be a call to #{method}#{args_msg}, but there wasn't"
    end 
    
    def negative_failure_message
      super
      "Did not expect there to be a call to #{method}#{args_msg}, but there was"
    end
             
    protected

    def not_def
      '[^def\s]'
    end

    def dot_expr
      case dot
      when String
        Regexp.escape(dot)
      when Symbol
        "#{content.form}\." if content.respond_to? :form
      else
        dot ? "#{not_def}\." : not_def
      end
    end
                   
  end
  
  def have_call(method, options = {})
    HaveCall.new(method, options)
  end  

  def have_dot_call(method, options = {})
    have_call method, options.merge(:dot => true)
  end  
  
  def have_form_call(method, options = {})
    have_call method, options.merge(:dot => :form)
  end  
  
end
