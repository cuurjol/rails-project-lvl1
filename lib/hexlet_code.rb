# frozen_string_literal: true

module HexletCode
  autoload(:ElementBuilder, 'hexlet_code/element_builder.rb')
  autoload(:Elements, 'hexlet_code/elements.rb')
  autoload(:Error, 'hexlet_code/error.rb')
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:FormTemplate, 'hexlet_code/form_template.rb')
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:VERSION, 'hexlet_code/version.rb')

  def self.form_for(model, method: 'post', url: '#')
    form_attributes = { action: url, method: method }
    form_builder = FormBuilder.new(model)
    form_template = FormTemplate.new(form_builder, form_attributes)

    yield(form_builder) if block_given?
    form_template.render
  end
end
