begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "code-spec"
    gem.summary = %Q{Code file RSpec 2 matchers}
    gem.description = %Q{Code file RSpec 2 matchers that make it easy to spec Ruby code files, fx updated or generated by a Thor generator}
    gem.email = "kmandrup@gmail.com"
    gem.homepage = "http://github.com/kristianmandrup/code-spec"
    gem.authors = ["Kristian Mandrup"]
    gem.add_development_dependency "rspec", ">= 2.0.0"
    gem.add_dependency "require_all",       "~> 1.2.0"
    gem.add_dependency "sugar-high",        "~> 0.3.0"
    gem.add_dependency "activesupport",     ">= 3.0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end
