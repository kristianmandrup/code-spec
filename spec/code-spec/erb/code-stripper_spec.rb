require 'spec_helper'

module CodeSpec
  module Erb
    describe '#erb_code' do
      context "valid ERB file" do
        it "should get only the ERB code from a valid ERB file" do
          CodeSpec::Erb.debug = false # true
          erb_file = File.join(fixtures_dir, 'view-file.erb')
          File.new(erb_file).erb_code.should match_lines %{for @item in @items\nhello :you\nhello :me}
        end        
      end
    end
  end
end