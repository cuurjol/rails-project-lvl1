# frozen_string_literal: true

module HexletCode
  class FormBuilder
    INPUTS = %i[string password text boolean select].freeze

    private_constant(:INPUTS)

    attr_accessor :elements
    attr_reader :model

    def initialize(model)
      @model = model
      @elements = []
    end

    def input(field_name, **attributes)
      type = attributes.delete(:as) || :string
      raise(Error, 'Invalid type for Input element') unless INPUTS.include?(type)

      attributes[:name] = field_name
      attributes[:value] = model.public_send(field_name)
      attributes[:type] = type

      elements << ElementBuilder.build(attributes[:type], attributes)
    end

    def reset(button_name = 'Reset')
      attributes = { name: 'reset', type: 'reset', value: button_name }
      elements << ElementBuilder.build(type, attributes)
    end

    def submit(button_name = 'Save')
      attributes = { name: 'submit', type: 'submit', value: button_name }
      elements << ElementBuilder.build(:submit, attributes)
    end
  end
end
