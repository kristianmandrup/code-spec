require 'spec_helper'

describe 'Formtastic form matcher' do      
  with_form_helper :formtastic
  
  context "Formtastic example 1 view file" do
    form_file = File.join(erb_fixtures_dir, 'formtastic-ex1.erb')
    it "content should match form expectations" do      
      form_file.should have_content do |content|
        content.erb_code.should have_semantic_form_for '@article' do |form|
          form.should have_inputs "Basic"
        end
      end
    end
  end
end





