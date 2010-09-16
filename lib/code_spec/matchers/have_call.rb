# This method tries to see if a specific method is contained in the generated file.
# It can operate (should) on either a file name or the raw content 
#
#   generated_file_name.should have_method "hello" # 'my/path/say_hello.rb'.should have_method "hello"
#
#   say_hello_file_content.should have_method "hello"
#
module RSpec::RubyContentMatchers
  class HaveCall < RSpec::RubyContentMatcher
    attr_accessor :method_name, :args, :dot, :content

    def initialize(method_name, options = {})
      self.method_name = method_name.to_s
      self.args = case options
      when Hash         
        self.dot = options[:dot]
        options[:args] 
      else 
        (options == {}) ? nil : options
      end
      
      self.args = ":#{args}" if args.kind_of? Symbol      
    end

    def matches?(content)
      @content = content 
      def_pos = (content =~ /def(.*)#{method_name}/) || 999
      call_pos = (content =~ /[^def]?#{method_name}/) || 999

      arguments_expr = case args
      when String
        args_expr
      when Array 
        args.flatten.inject("") do |res, arg|
          arg_val = (arg.kind_of?(String) && arg[0] == '#') ? arg[1..-1] : arg.inspect
          res << '(\s|,|\w|:)*' + arg_val
        end
      else
        return nil
      end

      expr = if (def_pos < call_pos) || dot == :form
        /#{dot_expr}#{method_name}#{arguments_expr}/m        
      else
        /#{dot_expr}?#{method_name}#{arguments_expr}/m
      end
      @expr = expr   
      debug "expr = #{expr}"
      debug "content = %{#{content}}"
      debug "content =~ #{expr}"      
      (content =~ expr)
    end          
  
    def failure_message
      super
      "Expected there to be a call to #{method_name}#{args_msg}, but there wasn't. Regexp: #{@expr} did not match\n#{@content}"
    end 
    
    def negative_failure_message
      super
      "Did not expect there to be a call to #{method_name}#{args_msg}, but there was"
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
  
  def have_call(method_name, options = {})
    HaveCall.new(method_name, options)
  end  

  def have_dot_call(method_name, options = {})
    have_call method_name, options.merge(:dot => true)
  end  
  
  def have_form_call(method_name, options = {})
    have_call method_name, options.merge(:dot => :form)
  end  
  
end
