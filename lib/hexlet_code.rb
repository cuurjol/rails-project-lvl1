# frozen_string_literal: true

module HexletCode
  autoload(:Elements, 'hexlet_code/elements.rb')
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:FormTemplate, 'hexlet_code/form_template.rb')
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:VERSION, 'hexlet_code/version.rb')

  def self.form_for(model, form_attributes = {}, &block)
    form_builder = FormBuilder.new(model, form_attributes)
    block.call(form_builder) if block_given?

    FormTemplate.render(form_builder)
  end
end
