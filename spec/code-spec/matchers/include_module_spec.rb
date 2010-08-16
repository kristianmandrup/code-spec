require 'spec_helper'

describe 'include module matcher' do    
  context "content without include Greeting" do
    no_include = %q{
        class Hello < Greeting
          def hello
          end
        end}    
    
    it "should not have include Greeting" do            
      no_include.should_not include_module :greeting do |content|
        puts content
      end
    end
  end
  
  context "content with include Greeting" do
    with_module = %q{
        class Hello
          include Greeting
          
          def hello
          end
        end}    
    
    it "should have include Greeting" do            
      with_module.should include_module :greeting do |content|
        puts content
      end
    end
  end
end



