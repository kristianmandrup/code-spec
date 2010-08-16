require 'spec_helper'

describe 'inherit matcher' do    
  context "content with class that inherits from Greeting" do
    no_subclass = %q{
        class Hello
          def hello
          end
        end}    

    it "should not inherit from Greeting" do            
      no_subclass.should_not inherit_from :greeting do |content|
        puts content
      end
    end
  end

  context "content with subclass Greeting" do
    with_subclass = %q{
        class Hello < Greeting
          def hello
          end
        end}    

    it "should not inherit_from Greeting" do            
      with_subclass.should inherit_from :greeting do |content|
        puts content
      end
    end
  end
end



