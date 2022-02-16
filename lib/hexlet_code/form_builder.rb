# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :model, :elements

    def initialize(model)
      @model = model
      @elements = []
    end

    def input(field_name, **attributes)
      type = attributes.delete(:as) || :string
      attributes[:name] = field_name
      attributes[:value] = model.public_send(field_name)
      attributes[:type] = type

      elements << Object.const_get("HexletCode::Elements::#{type.to_s.capitalize}Input").new(attributes)
    end

    def reset(button_name = 'Reset')
      attributes = { name: :reset, type: :reset, value: button_name }
      elements << HexletCode::Elements::Button.new(attributes)
    end

    def submit(button_name = 'Save')
      attributes = { name: :submit, type: :submit, value: button_name }
      elements << HexletCode::Elements::Button.new(attributes)
    end
  end
end
