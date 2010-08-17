require 'spec_helper'

describe 'Simpleform form matcher' do    
  with_form_helper :simpleform
  
  context "Simpleform example 1 view file" do
    form_file = File.join(erb_fixtures_dir, 'simpleform-ex1.erb')

    it "content should match form expectations" do            
      form_file.should have_content do |content|
        content.erb_code.should have_simple_form_for '@user' do |form|
          form.should have_username
        end
      end
    end
  end
end





