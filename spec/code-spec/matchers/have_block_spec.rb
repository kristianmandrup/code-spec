require 'spec_helper'

describe 'block matcher' do    
  context "content without block" do
    not_class_self = %q{
        def hello
        end}    
    
    it "should not have block" do            
      not_class_self.should_not have_block :hello
    end
  end
  
  context "content with block: hello do" do  
    content = %q{
      hello do
        blip
      end # do}    
  
    it "should have block" do            
      content.should have_block :hello
    end
  end
  
  context "content with block: hello :angel do" do  
    content = %q{
      hello :angel do
        blip
      end # do}    
  
    it "should have block" do            
      content.should have_block :hello, :args => ':angel'
    end
  end
      
  context "content with block: hello :angel do |x,y|" do  
    content = %q{
      hello :angel do |x,y|
        blip
      end # do}    

    it "should have block" do            
      content.should have_block :hello, :args => ':angel', :block_args => 'x,y' do |block|
        block.form.should_not be_nil
      end
    end
  end
  
  context "content with block: hello :angel do |x,y|" do  
    content = %q{
      form_for :person do |my_form|
        my_form.input :name
      end # do}    

    it "should have my_form input called :name" do            
      content.should have_block :form_for, :args => ':person' do |form_block|
        form_block.should have_form_call :input, :args => ':name'
      end
    end
  end
  
end



