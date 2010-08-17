require 'rspec'
require 'rspec/autorun'
require 'code-spec'

def fixtures_dir
  File.expand_path(File.dirname(__FILE__) + '/code-spec/fixtures')
end

def erb_fixtures_dir
  File.join(fixtures_dir, 'erb')
end