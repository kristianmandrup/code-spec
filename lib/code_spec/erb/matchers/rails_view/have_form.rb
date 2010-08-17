module Erb::RailsForm
  module Base
    module ContentMatchers
      def have_form_block name
        have_block :form_for, :args => name
      end

      def self.form_helpers
        [:check_box, :file_field, :hidden_field, :label, :password_field, :radio_button, :text_area]
      end

      form_helpers.each do |name|
        class_eval %{
          def have_#{name} obj_name, args=nil  
            args = args ? ":name => \#{obj_name}, \#{args}" : ":name => \#{obj_name}"
            have_form_call :#{name}, :args => args
          end        
        }
      end
    end
  end
  
  module Tags
    
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
  
  module Options
    def self.options_methods
      [ :grouped_collection_select, :option_groups_from_collection_for_select, :option_groups_from_collection_for_select, 
        :options_from_collection_for_select, :time_zone_options_for_select ]

    options_methods.each do |name|
      class_eval %{
        def have_#{name} name
          have_form_call :#{name}
        end
      }
    end

    def self.name_options_methods       
      [ :collection_select, :grouped_collection_select, :select, :time_zone_select ]
    end

    name_options_methods.each do |name|
      class_eval %{
        def have_#{name} name
          have_form_call :collection_select, :args => ":#{name}"
        end
      }
    end
  end

  module Links
    def self.link_methods       
      [ :button_to, :link_to, :mail_to ]
    end

    link_methods.each do |name|
      class_eval %{
        def have_#{name} args
          have_form_call :collection_select, :args => args
        end
      }
    end
    
    def have_submit_button 
      HaveDotCall.new(:submit)
    end
  end

  end
end
