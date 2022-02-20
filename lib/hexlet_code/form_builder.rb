# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :model, :form_attributes, :elements

    def initialize(model, form_attributes = {})
      @model = model
      @form_attributes = filter_attributes(form_attributes)
      @elements = []
    end

    def input(field_name, **attributes)
      attributes[:name] = field_name
      attributes[:value] = model.public_send(field_name)
      attributes[:type] = attributes.delete(:as) || :string

      elements << attributes
    end

    def reset(button_name = 'Reset', **attributes)
      attributes = attributes.slice(:id, :class, :style)
      elements << { name: :reset, type: :reset, value: button_name }.merge(attributes)
    end

    def submit(button_name = 'Save', **attributes)
      attributes = attributes.slice(:id, :class, :style)
      elements << { name: :submit, type: :submit, value: button_name }.merge(attributes)
    end

    private

    def filter_attributes(attributes)
      attributes[:action] = attributes.delete(:url) || '#'
      attributes[:method] = attributes[:method] || :post
      attributes.slice(:action, :method, :id, :class, :style)
    end
  end
end
