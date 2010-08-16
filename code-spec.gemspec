# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{code-spec}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kristian Mandrup"]
  s.date = %q{2010-08-16}
  s.description = %q{Code file RSpec 2 matchers that make it easy to spec Ruby code files, fx updated or generated by a Thor generator}
  s.email = %q{kmandrup@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".document",
     ".gitignore",
     ".rspec",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "lib/code-spec.rb",
     "lib/code_spec/matchers/content_matcher.rb",
     "lib/code_spec/matchers/have_block.rb",
     "lib/code_spec/matchers/have_call.rb",
     "lib/code_spec/matchers/have_calls.rb",
     "lib/code_spec/matchers/have_class_self.rb",
     "lib/code_spec/matchers/have_comment.rb",
     "lib/code_spec/matchers/have_method.rb",
     "lib/code_spec/matchers/have_module.rb",
     "lib/code_spec/matchers/have_region.rb",
     "lib/code_spec/matchers/have_subclass.rb",
     "lib/code_spec/matchers/include_module.rb",
     "lib/code_spec/matchers/inherit_from.rb",
     "spec/code-spec/matchers/class_self_spec.rb",
     "spec/code-spec/matchers/have_block_spec.rb",
     "spec/code-spec/matchers/have_call_spec.rb",
     "spec/code-spec/matchers/have_calls_spec.rb",
     "spec/code-spec/matchers/have_class_spec.rb",
     "spec/code-spec/matchers/have_method_spec.rb",
     "spec/code-spec/matchers/have_module_spec.rb",
     "spec/code-spec/matchers/have_region_spec.rb",
     "spec/code-spec/matchers/have_subclass_spec.rb",
     "spec/code-spec/matchers/include_module_spec.rb",
     "spec/code-spec/matchers/inherit_from_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/kristianmandrup/code-spec}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Code file RSpec 2 matchers}
  s.test_files = [
    "spec/code-spec/matchers/class_self_spec.rb",
     "spec/code-spec/matchers/have_block_spec.rb",
     "spec/code-spec/matchers/have_call_spec.rb",
     "spec/code-spec/matchers/have_calls_spec.rb",
     "spec/code-spec/matchers/have_class_spec.rb",
     "spec/code-spec/matchers/have_method_spec.rb",
     "spec/code-spec/matchers/have_module_spec.rb",
     "spec/code-spec/matchers/have_region_spec.rb",
     "spec/code-spec/matchers/have_subclass_spec.rb",
     "spec/code-spec/matchers/include_module_spec.rb",
     "spec/code-spec/matchers/inherit_from_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 2.0.0.beta.19"])
      s.add_runtime_dependency(%q<require_all>, [">= 1.1.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0.0.rc"])
    else
      s.add_dependency(%q<rspec>, [">= 2.0.0.beta.19"])
      s.add_dependency(%q<require_all>, [">= 1.1.0"])
      s.add_dependency(%q<activesupport>, [">= 3.0.0.rc"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.0.0.beta.19"])
    s.add_dependency(%q<require_all>, [">= 1.1.0"])
    s.add_dependency(%q<activesupport>, [">= 3.0.0.rc"])
  end
end

