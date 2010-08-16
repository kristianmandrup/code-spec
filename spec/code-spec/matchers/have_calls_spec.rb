require 'spec_helper'

describe 'method calls matcher' do    
  context "content without calls" do
    not_class_self = %q{
        def x
        end
  
        def y
        end        
        }    
    
    it "should not have calls to x or y" do            
      not_class_self.should_not have_calls :x, :y do |content|
        puts content
      end
    end
  end
  
  context "content with calls to x and y" do  
    class_self = %q{
        def x
          x
          y
        end}    

    it "should have calls to x and y" do            
      class_self.should have_calls :x, :y do |content|
        puts "content: #{content}"
      end
    end
  end

  context "content with calls to x and y" do  
    class_self = %q{
        def x
          x(2)
          y 3
        end}    
  
    it "should have calls: x(2) and y 3" do            
      class_self.should have_calls :x => '2', :y => '3' do |content|
        puts "content: #{content}"
      end
    end
  end
end
