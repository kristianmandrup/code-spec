require 'rspec'
require 'require_all'      
require 'active_support/inflector'      

module RSpec
  module RubyContentMatchers
  end
end

require 'code_spec/matchers/content_matcher'
require_all File.dirname(__FILE__) + '/code_spec/matchers'

RSpec.configure do |config|
  config.include(RSpec::RubyContentMatchers)  
end
