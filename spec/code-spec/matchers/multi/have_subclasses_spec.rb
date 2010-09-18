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
      no_class.should_not have_subclasses :x
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
    it "should not have subclass X of Y" do
      class_x.should_not have_subclasses :x, :superclass => :y
    end
  end

  context "content with subclass X of Y" do  
    class_x = %q{
      class X < Y
        def hello
          blip
        end
      end
    }    
    it "should have subclass X of Y" do
      class_x.should have_subclasses :x, :superclass => :y
      class_x.should_not have_subclasses :y, :superclass => :x
    end
  end
  
  context "content with subclasses X and Y of Z" do  
    classs_x_y = %q{
      class X < Z
        def hello
          blip
        end
      end

      class Y < Z
        def hello
          blip
        end
      end
    }    
    it "should have classs X and Y of Z" do            
      classs_x_y.should have_subclasses :x, :y, :superclass => :z
    end
  end
end