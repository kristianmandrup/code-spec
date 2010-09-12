require 'spec_helper'

describe 'module matcher' do    
  context "content without class Hello" do
    no_class = %q{
        module Hello
          def hello
          end
        end}    
    
    it "should not have class Hello" do            
      no_class.should_not have_class :Hello do |content|
        content.should_not be_empty
      end
    end
  end
  
  context "content with class Hello" do
    with_class = %q{
        class Hello
          def hello
          end
        end}    
    
    it "should have class Hello" do            
      with_class.should have_class :Hello do |content|
        content.should_not be_empty
      end
    end
  end
end



