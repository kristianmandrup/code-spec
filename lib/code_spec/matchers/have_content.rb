module RSpec::RubyContentMatchers
  class HaveContent
    attr_accessor :file_path

    def initialize
    end

    def matches?(file_path, &block)      
      self.file_path = file_path
      return nil if File.blank? file_path
      file = File.new(file_path)
      yield file.read if block
      true
    end
    
    def failure_message
      display "Expected the file #{file_path} to have content" 
    end 
    
    def negative_failure_message
      display "Did not expect the file #{file_path} to have content" 
    end    
  end

  def have_content
    HaveContent.new
  end
end
