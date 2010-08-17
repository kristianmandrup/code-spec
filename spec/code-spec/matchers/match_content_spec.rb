require 'spec_helper'

describe 'inherit matcher' do    
  context "content with class that inherits from Greeting" do
    logfile = File.join(fixtures_dir, 'logfile.log')

    it "content should match some lines" do            
      logfile.should have_content do |content|
        content.should match_lines %{By default we are in into log mode\nThis is debugging mode!\nMore info... but still in debugging mode}
        content.should match_lines %{By default we are in into log mode:::This is debugging mode!:::More info... but still in debugging mode}, :separator => ':::'
      end
    end
  end
end





