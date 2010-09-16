require 'spec_helper'

describe 'method call matcher with args' do      
  context "content with call devise" do  
    call = %{
        devise :database_authenticatable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
    }
    it "should have call to hello" do            
      call.should have_call :devise, :args => [:confirmable, :trackable]
      call.should_not have_call :devise, :args => [:confirmable, :trackable_ids]      
    end
  end 

  context "content with call devise" do  
    call = %{
        devise :database_authenticatable, confirm_me, :recoverable, "hello"
    }
    it "should have call to hello" do            
      call.should have_call :devise, :args => ['#confirm_me', "hello"]
      call.should_not have_call :devise, :args => ['#hello']      
    end
  end 
end