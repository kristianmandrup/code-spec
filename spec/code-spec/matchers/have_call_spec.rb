require 'spec_helper'

describe 'method call matcher' do    
  context "content without method call" do
    not_call = %q{
        def hello
        end}    
    
    it "should not have call hello" do            
      not_call.should_not have_call :hello
    end
  end
  
  context "content with call hello" do  
    call = 'hello'
    it "should have call to hello" do            
      call.should have_call :hello
    end
  end 
  
  context "content with call hello" do  
    call = %q{
      def hello
        x.hello
      end}
    it "should have call to hello" do            
      call.should have_dot_call :hello
    end
  end  
  
  context "class User with call role_strategy" do    
    clazz = %q{
  class User < ActiveRecord::Base  
    include RoleModels::Generic 
    role_strategy :admin_flag
  
    roles :admin,:user
  
          end}
  
    it "should have call to role_strategy with args :admin_flag" do            
      clazz.should have_call :role_strategy, :args => ':admin_flag'
    end
  end
  
  context "Migration should have usual structure" do    
    migration_klass = %q{
      class DoColumns < ActiveRecord::Migration
        def self.up  
          create_table :users do |t|
            t.string  :name
            t.integer :age
            t.boolean :admin
          end
        end
  
        def self.down
          drop_table :users  
        end
      end}
        
    it "should have call to role_strategy with args :admin_flag" do            
      migration_klass.should have_class_method :up
  
      migration_klass.should have_class_method :down do |down|
        puts down
        down.should have_call 'drop_table', :users
      end
  
    end
  end
end



