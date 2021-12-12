# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_accessor :form_inner_tags
    attr_reader :model

    def initialize(model)
      @model = model
      @form_inner_tags = []
    end

    def input(attribute, **options)
      as_key = options.delete(:as)
      value = model.public_send(attribute)
      attributes = options.merge(name: attribute)
      tag = as_key.nil? ? build_input_tag(value, attributes) : build_textarea_tag(value, attributes)
      label_tag = build_label_tag(attribute, for: attribute)
      form_inner_tags.push(label_tag, tag)
    end

    def submit(button_name = 'Save')
      attributes = { name: 'commit', type: 'submit', value: button_name }
      form_inner_tags.push(Tag.build('input', **attributes))
    end

    private

    def build_textarea_tag(value, attributes)
      attributes.update(cols: 20) if attributes[:cols].nil?
      attributes.update(rows: 40) if attributes[:rows].nil?
      Tag.build('textarea', **attributes) { value }
    end

    def build_input_tag(value, attributes)
      attributes.update(value: value) unless value.nil?
      attributes.update(type: 'text')
      Tag.build('input', **attributes)
    end

    def build_label_tag(value, attributes)
      Tag.build('label', **attributes) { value.to_s.capitalize }
    end
  end
end
