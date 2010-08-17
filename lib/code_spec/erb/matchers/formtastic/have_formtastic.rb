module Erb::Formtastic
  module ContentMatchers
    def have_semantic_form_for name
      have_form_call :semantic_form_for, :args => name
    end

    def have_inputs name 
      have_form_call :inputs, :args => ":name => #{name}"
    end
    alias_method :have_input_field_set, :have_inputs

    def have_buttons name 
      have_form_call :buttons
    end
    alias_method :have_button_field_set, :have_buttons

    def have_label name 
      have_form_call :label, :args => ":#{name}"
    end

    def self.inputs_list
      [ :radio, :date, :text, :select, :checkboxes, :time_zone, :password, :date, :datetime, :time, :boolean, :string, :numeric, :country, :hidden ]
    end

    inputs_list.each do |name|
      class_eval %{
        def have_#{name} name
          have_form_call :input, :args => ":\#{name}, :as => :#{name}"
        end

        def have_required_#{name} name
          have_form_call :input, :args => ":\#{name}, :required => true, :as => :#{name}"
        end
      }
    end

    def have_input name 
      have_form_call :input, :args => ":#{name}"
    end

    def have_required_input name 
      have_form_call :input, :args => ":#{name}, :required => true"
    end

    def have_errors_for name
      have_form_call :input, :args => ":#{name}"
    end
    alias_method :have_inline_errors_for, :have_errors_for

    def have_semantic_errors
      have_form_call :semantic_errors
    end

    def have_semantic_fields_for
      have_form_call :semantic_fields_for
    end            

    def have_commit_button 
      have_form_call :commit_button
    end
  end
end
