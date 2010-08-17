module Erb::Formtastic
  module ContentMatchers
    def have_semantic_form_block name
      HaveBlock.new(:have_semantic_form_for, :args => name)
    end

    def have_inputs_block name 
      HaveBlock.new(:inputs, :args => ":name => #{name}")
    end

    def have_buttons_block name 
      HaveBlock.new(:buttons)
    end

    def have_commit_button 
      HaveDotCall.new('commit_button')
    end
  end
end
