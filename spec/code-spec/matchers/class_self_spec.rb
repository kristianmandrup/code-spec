require 'spec_helper'

describe 'class_self matcher' do    
  context "content without class << self" do
    not_class_self = %q{
        def hello
        end}    
    
    it "should not have class << self" do            
      not_class_self.should_not have_class_self
    end
  end
  
  context "content with class << self" do  
    class_self = %q{
      class << self
        def hello
        end
      end # class self}    

    it "should have class << self" do            
      class_self.should have_class_self do |content|
        puts "content: #{content}"
      end
    end
  end
end



