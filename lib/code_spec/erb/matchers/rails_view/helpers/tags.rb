module Erb::RailsForm
  module ContentMatchers
    module TagHelpers
      def have_field_set_tag legend
        have_form_call :field_set_tag, :args => "'#{legend}'"
      end
    
      def have_form_tag url
        have_form_call :form_tag, :args => "'#{url}'"
      end
    
      def have_password_field_tag name = "password"
        have_form_call :password_field_tag, :args => "'#{name}'"
      end

      def self.tags_list
        [ :check_box_tag, :file_field_tag, :text_field_tag, :hidden_field_tag, :image_submit_tag, 
          :radio_button_tag, :select_tag, :label_tag, :submit_tag, :text_area_tag ]
      end

      tags_list.each do |name|
        class_eval %{
          def have_#{name} name
            have_form_call :#{name}, :args => "'\#{name}'"
          end
        }
      end    
    end
  end
end