require 'spec_helper'

describe 'method matcher' do    
  context "content without method" do
    no_method = %q{
        class X
          hello
          hi
        end}    
    
    it "should not have method hello" do            
      no_method.should_not have_methods :hello, :hi do |content|
        content.should_not be_empty
      end
    end
  end

  context "content with method hello" do  
    with_method = %q{
        def hello
          blip
        end
    }    
    it "should have method hello" do            
      with_method.should have_methods :hello
      with_method.should_not have_methods :hi
      with_method.should_not have_methods :hello, :hi
    end
  end
  
  context "content with method hello" do  
    with_method = %q{
        def hello
          blip
        end

        def hi
          blip
        end        
    }    
    it "should have method hello" do            
      with_method.should have_methods :hello, :hi
    end
  end
end