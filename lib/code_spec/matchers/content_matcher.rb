module RSpec
  class RubyContentMatcher
    attr_reader :content, :end_option, :alt_end, :content_matches

    def initialize name
      @end_option = name
    end

    def index
      0
    end

    def indexes
      nil
    end

    def debug?
      false
    end
         
    def matches? content, &block
      @content = content
      match = is_match? content                                                        
      content_to_yield = if indexes
        content_matches[indexes.first] || content_matches[indexes.last]
      else
        content_matches[index]
      end          
      handle_result(content_to_yield, match, &block)
    end

    def is_match? content
      expr = get_expr(content) 
      debug "match expression: #{expr}"
      match = (content =~ expr)
      @content_matches = [$1, $2, $3]
      match
    end

    def handle_result content, match, &block 
      if block && match && content
        ruby_content = content.strip
        yield ruby_content        
      end
      match
    end      

    def get_expr content
      expr = /#{main_expr}#{comment_end}/m            
      if (content =~ expr).nil?                             
        /#{main_expr}#{end_expr}/m  
      else
        expr  
      end        
    end

    Q_ANY_GROUP = '(.*?)'
    ANY_GROUP = '(.*)'
        
    SPACES = '\s+'
    OPT_SPACES = '\s*'
    LPAR = '(\()'
    RPAR = '(\))'  
    OPT_ARGS = '(\(.+\))?'

    def opt expr
      "#{expr}?"
    end

    def args_msg
      args ? " with arguments #{args}" : ''
    end      

    def any_args_expr
      OPT_SPACES + OPT_ARGS
    end

    def args_expr
      args ? OPT_SPACES + opt(LPAR) + OPT_SPACES + "#{args}" + OPT_SPACES + opt(RPAR) : ''
    end

    def main_expr
      raise "Must override main_expr"
    end

    def end_expr
      "$"
    end

    def comment_end 
      alt_end != nil ? '#' + SPACES + "(#{end_option}|#{alt_end})" : '#' + SPACES + "#{end_option}"
    end
    
    def failure_message
      debug_content
    end

    def negative_failure_message
      debug_content
    end
      
    def debug_content
      debug "Content: #{content}"
    end
    
    def debug msg
      puts msg if debug?
    end      
  end
end