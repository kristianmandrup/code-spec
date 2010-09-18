require 'spec_helper'

describe 'classes matcher' do    
  context "no class" do
    no_class = %q{
        module X
          hello
          hi
        end
    }    
    
    it "should not have class X" do            
      no_class.should_not have_classes :x
    end
  end

  context "content with class X" do  
    class_x = %q{
      class X
        def hello
          blip
        end
      end
    }    
    it "should have class x" do
      class_x.should have_classes [:x]
      class_x.should_not have_classes :x, :y
    end
  end
  
  context "content with class X and Y" do  
    classs_x_y = %q{
      class X
        def hello
          blip
        end
      end

      class Y
        def hello
          blip
        end
      end
    }    
    it "should have classs x and y" do            
      classs_x_y.should have_classes :x, :y
    end
  end
end