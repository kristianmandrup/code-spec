require 'spec_helper'

describe 'Rails 3 form matcher' do    
  with_form_helper :railsform
  
  context "Rails 3 form example 1 view file" do
    form_file = File.join(erb_fixtures_dir, 'railsform-ex1.erb')

    it "content should match form expectations" do            
      form_file.should have_content do |content|
        content.erb_code.should have_form_for '@person' do |form|
          form.should have_label :name
        end
      end
    end
  end
end





