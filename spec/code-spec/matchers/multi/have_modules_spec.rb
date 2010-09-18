require 'spec_helper'

describe 'modules matcher' do    
  context "no module" do
    no_module = %q{
        class X
          hello
          hi
        end
    }    
    
    it "should not have module X" do            
      no_module.should_not have_modules :x
    end
  end

  context "content with module X" do  
    module_x = %q{
      module X
        def hello
          blip
        end
      end
    }    
    it "should have module x" do
      module_x.should have_modules :x
      module_x.should_not have_modules :x, :y
    end
  end
  
  context "content with module X and Y" do  
    modules_x_y = %q{
      module X
        def hello
          blip
        end
      end

      module Y
        def hello
          blip
        end
      end
    }    
    it "should have modules x and y" do            
      modules_x_y.should_not have_modules :x, :y
    end
  end
end