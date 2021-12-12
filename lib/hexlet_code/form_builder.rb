# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_accessor :form_inner_tags
    attr_reader :model

    def initialize(model)
      @model = model
      @form_inner_tags = []
    end

    def input(attribute, as: nil)
      value = model.public_send(attribute)
      tag_name = as.nil? ? 'input' : 'textarea'
      attributes = { name: attribute.to_s }
      attributes.update(as.nil? ? { type: 'text', value: value } : { cols: 20, rows: 40 })
      tag = Tag.build(tag_name, attributes) { value unless as.nil? }
      form_inner_tags.push(tag)
    end
  end
end
