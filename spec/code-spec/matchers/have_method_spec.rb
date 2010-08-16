require 'spec_helper'

describe 'method matcher' do    
  context "content without method" do
    no_method = %q{
        class X
        end}    
    
    it "should not have method hello" do            
      no_method.should_not have_method :hello do |content|
        puts content
      end
    end
  end
  
  context "content with method hello" do  
    with_method = %q{
        def hello
        end}    
    it "should have method hello" do            
      with_method.should have_method :hello do |content|
        puts "content: #{content}"
      end
    end
  end

  context "content: method hello with args (x, y)" do  
    with_method = %q{
        def hello(x, y)
        end}    
    it "should have method hello" do            
      with_method.should have_method :hello, :args => 'x, y' do |content|
        puts "content: #{content}"
      end
    end
  end

  context "content: method hello with args x, y" do  
    with_method = %q{
        def hello x, y
        end}    
    it "should have method hello with args x, y" do            
      with_method.should have_method :hello, :args => 'x, y' do |content|
        puts "content: #{content}"
      end
    end
  end

end



