require 'rspec'
require 'require_all'      
require 'active_support/inflector'      

module RSpec
  module RubyContentMatchers
  end
end

require 'code_spec/matchers/content_matcher'
require_all File.dirname(__FILE__) + '/code_spec/matchers'

require 'code_spec/content_helpers'
require 'code_spec/core_ext'

module FormHelperMacro  
  def with_form_helper name
    class_eval do
      include get_form_matcher(name)
    end
  end
  
  protected

  def get_form_matcher name
    case name
    when :formtastic
      Erb::Formtastic::ContentMatchers
    when :simpleform
      Erb::SimpleForm::ContentMatchers
    else
      Erb::RailsForm::ContentMatchers
    end    
  end  
end
 

RSpec.configure do |config|
  config.include RSpec::RubyContentMatchers 
  config.extend(FormHelperMacro) 
end

                                       


