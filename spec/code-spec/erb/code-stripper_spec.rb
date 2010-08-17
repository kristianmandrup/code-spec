require 'spec_helper'

module Erb
  module Code
    describe '#erb_code' do
      context "valid ERB file" do
        it "should get only the ERB code from a valid ERB file" do
          debug = false # true
          erb_file = File.join(fixtures_dir, 'view-file.erb')
          File.new(erb_file).erb_code.should match_lines %{for @item in @items\nhello :you\nhello :me}
        end        
      end
    end
  end
end