require 'spec_helper'

describe 'module matcher' do    
  context "content without module Hello" do
    no_module = %q{
        class Hello
          def hello
          end
        end}    
    
    it "should not have module Hello" do            
      no_module.should_not have_module :Hello do |content|
        puts content
      end
    end
  end
  
  context "content with module Hello" do
    with_module = %q{
        module Hello
          def hello
          end
        end}    
    
    it "should have module Hello" do            
      with_module.should have_module :Hello do |content|
        puts content
      end
    end
  end
end



