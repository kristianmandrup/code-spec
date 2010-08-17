module Erb::RailsForm
  module ContentMatchers
    module LinkHelpers
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