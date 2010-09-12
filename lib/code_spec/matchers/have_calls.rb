module RSpec::RubyContentMatchers
  class HaveCalls < HaveCall
    attr_reader :calls, :method, :args

    def initialize(*calls)
      case calls.first
      when Array, Hash
        @calls = calls.first
      else    
        @calls = calls
      end
    end

    def matches?(content)
      super
      case calls
      when Array
        do_list
      when Hash
        do_hash
      end
    end                              
    
    protected

    def do_list
      calls.each do |method|
        @method = method.to_s   
        expr = 
        has_def = (content =~ /def(.*)#{method}/)
        expr = if has_def
          /#{not_def}\s*#{method}/m
        else
          /#{not_def}?\s*#{method}/m
        end
        return false if (content =~ expr) == nil
      end
      true
    end    

    def do_hash
      calls.each_pair do |method, args|
        @method = method.to_s
        @args = args
        has_def = (content =~ /def(.*)#{method}/)
        expr = if has_def
          /#{not_def}\s*#{method}\s*#{args_expr}/m
        else
          /#{not_def}?\s*#{method}\s*#{args_expr}/m
        end         
        return false if (content =~ expr) == nil
      end
      true
    end    
  end
  
  def have_calls(*calls)
    HaveCalls.new(*calls)
  end  
end
