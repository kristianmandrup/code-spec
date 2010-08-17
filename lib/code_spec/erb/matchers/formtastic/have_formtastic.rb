module Erb::Formtastic
  module ContentMatchers
    def have_semantic_form_for name
      HaveBlock.new(:semantic_form_for, :args => name)
    end

    def have_inputs name 
      HaveBlock.new(:inputs, :args => ":name => #{name}")
    end
    alias_method :have_input_field_set, :have_inputs

    def have_buttons name 
      HaveBlock.new(:buttons)
    end
    alias_method :have_button_field_set, :have_buttons

    def have_label name 
      HaveDotCall.new(:label, :args => ":#{name}")
    end

    def self.inputs_list
      [ :radio, :date, :text, :select, :checkboxes, :time_zone, :password, :date, :datetime, :time, :boolean, :string, :numeric, :country, :hidden ]
    end

    inputs_list.each do |name|
      class_eval %{
        def have_#{name} name
          HaveDotCall.new(:input, :args => ":\#{name}, :as => :#{name}")
        end

        def have_required_#{name} name
          HaveDotCall.new(:input, :args => ":\#{name}, :required => true, :as => :#{name}")
        end
      }
    end

    def have_input name 
      HaveDotCall.new(:input, :args => ":#{name}")
    end

    def have_required_input name 
      HaveDotCall.new(:input, :args => ":#{name}, :required => true")
    end

    def have_errors_for name
      HaveDotCall.new(:input, :args => ":#{name}")      
    end
    alias_method :have_inline_errors_for, :have_errors_for

    def have_semantic_errors
      HaveDotCall.new(:semantic_errors)      
    end

    def have_semantic_fields_for
      HaveDotCall.new(:semantic_fields_for)
    end            

    def have_commit_button 
      HaveDotCall.new(:commit_button)
    end
  end
end
