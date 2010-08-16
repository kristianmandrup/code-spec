# Code spec

RSpec 2 matchers to facilitate making specs regarding Ruby code files, f.ex as generated or modified/mutated by a code generator.

## Install

gem install code-spec

## Usage

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
