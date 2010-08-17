module Erb::SimpleForm
  module ContentMatchers
    def have_simple_form_for name
      have_block :simple_form_for, :args => name
    end

    def have_input name 
      have_form_call :input, :args => ":#{name}"
    end

    def have_button name 
      have_form_call :button, :args => ":#{name}"
    end

    def self.standard_inputs
      [ :username, :email, :website, :age, :password, :remember_me]
    end

    def self.association_types
      [ :radio, :check_boxes]
    end

    def have_association name
      have_form_call :association, :args => ":#{name}"
    end

    association_types.each do |name|
      class_eval %{
        def have_#{name.to_s.pluralize} name
          have_form_call :association, :args => ":\#{name}, :as => :#{name}"
        end        
      }
    end

    standard_inputs.each do |name|
      class_eval %{
        def have_#{name}
          have_input :#{name}
        end 
      }
    end

    def have_commit_button 
      have_form_call :commit_button
    end
  end
end
