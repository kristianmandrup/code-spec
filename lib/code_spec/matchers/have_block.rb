module RSpec::RubyContentMatchers
  class HaveBlock < RSpec::RubyContentMatcher
    attr_reader :name, :args, :block_args, :do_option, :end_option, :block_arguments

    def initialize(name, options={})
      super options[:end] || name      
      @name = name.to_s
      @args = options[:args] 
      @do_option = options[:do].nil? ? true : options[:do]      
      @block_args = options[:block_args]
    end

    module BlockArgs
      attr_accessor :block_args, :form
      
      def form
        block_args[0]
      end
    end        

    def matches? content, &block
      @content = content
      blockargs = content.scan(/do\s+\|(.*?)\|/).flatten[0]
      @block_arguments = blockargs.split ',' if blockargs
      
      match = is_match? content                                                        
      content_to_yield = if indexes
        content_matches[indexes.first] || content_matches[indexes.last]
      else
        content_matches[index]
      end          
      handle_result(content_to_yield, match, &block)
    end

    def handle_result content, match, &block 
      if block && match && content
        ruby_content = content.strip  
        ruby_content.extend(BlockArgs)
        ruby_content.block_args = block_arguments
        yield ruby_content        
      end
      match
    end      

  
    def failure_message   
      super
      display "Expected there to be a block #{name}#{args_msg}#{block_args_msg}, but there wasn't"
    end 
    
    def negative_failure_message  
      super
      display "Did not expect there to be a block #{name}#{args_msg}, but there was"
    end               
    
    protected

    def block_args_msg
      " and block arguments #{block_args}" if block_args
    end
    
    def indexes
      [0, 2]
    end

    def main_expr
      "#{name}" + SPACES + "#{args_expr}#{do_expr}" + ANY_GROUP
    end

    def do_expr
      do_option == false ? '' : 'do' + SPACES + "#{block_args_expr}"
    end

    def args_expr
      args ? '(\()?\s*' + args + '\s*(\))?\s+' : ''
    end      

    def block_args_expr
      block_args ? '\|\s*' + block_args + '\s*\|' : ''
    end    

    def alt_end
      'do'
    end
  end
  
  def have_block(name, options={})
    HaveBlock.new(name, options)
  end
end