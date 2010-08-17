module Erb::SimpleForm
  module ContentMatchers
    def have_simple_form_block name
      HaveBlock.new(:simple_form_for, :args => name)
    end

    def have_input name 
      HaveDotCall.new(:input, :args => ":#{name}")
    end

    def have_button name 
      HaveDotCall.new(:button, :args => ":#{name}")
    end

    def self.standard_inputs
      [ :username, :email, :website, :age, :password, :remember_me]
    end

    def self.association_types
      [ :radio, :check_boxes]
    end

    def have_association name
      HaveDotCall.new(:association, :args => ":#{name}")
    end

    association_types.each do |name|
      class_eval %{
        def have_#{name.to_s.pluralize} name
          HaveDotCall.new(:association, :args => ":\#{name}, :as => :#{name}")
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
      HaveDotCall.new('commit_button')
    end
  end
end
