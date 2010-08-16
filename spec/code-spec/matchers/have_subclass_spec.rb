require 'spec_helper'

describe 'subclass matcher' do    
  context "content without subclass Greeting" do
    no_subclass = %q{
        class Hello
          def hello
          end
        end}    
    
    it "should not have subclass Greeting" do            
      no_subclass.should_not have_subclass :hello, :greeting
    end
  end
  
  context "content with subclass Greeting" do
    with_subclass = %q{
        class Hello < Greeting
          def hello
          end
        end}    
    
    it "should not have subclass Greeting" do            
      with_subclass.should have_subclass :hello, :greeting do |content|
        content.should_not be_empty
      end
    end
  end
end



