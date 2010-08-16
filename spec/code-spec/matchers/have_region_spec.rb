require 'spec_helper'

describe 'region matcher' do    
  context "content with only protected region" do
    only_protected_region = %q{
        def hello
        end
        
        protected
        
        def goodbye
        end
        
        }    
    
    it "should not have public region" do            
      only_protected_region.should_not have_region :public do |content|
        puts content
      end
    end

    it "should have protected region" do            
      only_protected_region.should have_region :protected do |content|
        puts content
      end
    end
  end
  
  context "content with only private region" do
    only_private_region = %q{
        def hello
        end
        
        private
        
        def goodbye
        end
        
        }    
    
    it "should not have public region" do            
      only_private_region.should_not have_region :public do |content|
        puts content
      end
    end

    it "should have private region" do            
      only_private_region.should have_region :private do |content|
        puts content
      end
    end
  end
end



