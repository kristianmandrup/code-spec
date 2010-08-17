module Erb::RailsForm
  module ContentMatchers
    module OptionHelpers
      def self.options_methods
        [ :grouped_collection_select, :option_groups_from_collection_for_select, :option_groups_from_collection_for_select, 
          :options_from_collection_for_select, :time_zone_options_for_select ]
      end

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
  end
end