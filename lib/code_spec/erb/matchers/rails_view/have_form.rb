module Erb::RailsForm
  module Base
    module ContentMatchers
      def have_form_block name
        HaveBlock.new(:form_for, :args => name)
      end

      def self.form_helpers
        [:check_box, :file_field, :hidden_field, :label, :password_field, :radio_button, :text_area]
      end

      form_helpers.each do |name|
        class_eval %{
          def have_#{name} obj_name, args=nil  
            args = args ? ":name => \#{obj_name}, \#{args}" : ":name => \#{obj_name}"
            HaveDotCall.new(:#{name}, :args => args)
          end        
        }
      end
    end
  end
  
  module Tags
    
    def have_field_set_tag legend
      HaveDotCall.new(:field_set_tag, :args => "'#{legend}'")
    end
        
    def have_form_tag url
      HaveDotCall.new(:form_tag, :args => "'#{url}'")            
    end
        
    def have_password_field_tag name = "password"
      HaveDotCall.new(:password_field_tag, :args => "'#{name}'")            
    end

    def self.tags_list
      [ :check_box_tag, :file_field_tag, :text_field_tag, :hidden_field_tag, :image_submit_tag, 
        :radio_button_tag, :select_tag, :label_tag, :submit_tag, :text_area_tag ]
    end

    tags_list.each do |name|
      class_eval %{
        def have_#{name} name
          HaveDotCall.new(:#{name}, :args => "'\#{name}'")
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
          HaveDotCall.new(:#{name})
        end
      }
    end

    def have_collection_select name             
      HaveDotCall.new(:collection_select, :args => ":#{name}") 
    end     
    
    def have_grouped_collection_select
      HaveDotCall.new(:grouped_collection_select, :args => ":#{name}")       
    end

    def have_select name
      HaveDotCall.new(:select, :args => "'#{name}'")      
    end
    
    def have_time_zone_select name
      HaveDotCall.new(:time_zone_select, :args => "'#{name}'")
    end
  end

  module Links
    def have_button_to args 
      HaveDotCall.new(:button_to, :args => args)
    end

    def have_link_to args 
      HaveDotCall.new(:link_to, :args => name)
    end

    def have_mail_to args
      HaveDotCall.new(:mail_to, :args => args)
    end

    def have_submit_button 
      HaveDotCall.new(:submit)
    end
  end

  end
end
