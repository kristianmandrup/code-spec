module RSpec::RubyContentMatchers
  class HaveRegion < RSpec::RubyContentMatcher
    attr_reader :region

    def initialize(region)
      @region = region.to_s
      super @region      
    end
  
    def failure_message 
      super
      "Expected there to be a #{region} region"
    end 
    
    def negative_failure_message    
      super
      "Did no expected there to be a #{region} region"
    end               
    
    protected

    def main_expr
      "#{region}" + ANY_GROUP     
    end
    
    def end_expr
      '(private|protected|public|$)'
    end
  end

  def have_region name
    HaveRegion.new name
  end    
  
  def have_public
    HaveRegion.new :public
  end    

  def have_protected
    HaveRegion.new :protected
  end    

  def have_private
    HaveRegion.new :private
  end    
end
      

