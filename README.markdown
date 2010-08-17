# Code spec

RSpec 2 matchers to facilitate making specs regarding Ruby code files, f.ex as generated or modified/mutated by a code generator.
Also includes matchers to help spec ERB code that include either:

* Standard rails forms
* Formtastic
* Simpleform  

## Install

gem install code-spec

## Usage: Basic code matchers

See specs for examples on how to use it.

Example: Nested DSL
<pre>  ...   
  with_subclass = %q{
      class Hello < Greeting
        def hello
          # howdy
        end
      end}    
  
  it "should not have subclass Greeting" do            
    with_subclass.should have_subclass :hello, :greeting do |content|
      content.should have_method :hello do |hello|
        hello.should have_comment 'howdy'
      end
    end
  end
</pre>

## Usage: Form matchers

*with_form_helper* is used to specify which form helper to use. It can be either:

* :formtastic
* :simpleform
* :railsform

<pre>
describe 'Formtastic form matcher' do      
  with_form_helper :formtastic

  context "Formtastic example 1 view file" do
    let(:form_file) { File.join erb_fixtures_dir, 'formtastic-ex1.erb' }

    it "content should match form expectations" do      
      form_file.should have_content do |content|
        content.erb_code.should have_semantic_form_for '@article' do |form|
          form.should have_inputs "Basic"
        end
      end
    end
  end
end
</pre>  

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Kristian Mandrup. See LICENSE for details.
