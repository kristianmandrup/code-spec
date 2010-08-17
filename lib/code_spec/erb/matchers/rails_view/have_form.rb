require_all File.dirname(__FILE__) + '/helpers'

module Erb::RailsForm
  module ContentMatchers
    def have_form_for name
      have_block :form_for, :args => name
    end

    def self.form_helpers
      [:check_box, :file_field, :hidden_field, :label, :password_field, :radio_button, :text_area]
    end

    form_helpers.each do |name|
      class_eval %{
        def have_#{name} obj_name, args=nil  
          args = args ? ":\#{obj_name}, \#{args}" : ":\#{obj_name}"
          have_form_call :#{name}, :args => args
        end        
      }
    end
      
    include LinkHelpers
    include OptionHelpers
    include TagHelpers
  end
end
