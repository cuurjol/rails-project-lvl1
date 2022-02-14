# frozen_string_literal: true

module HexletCode
  module ElementBuilder
    ELEMENT_TYPES = {
      string: HexletCode::Elements::StringInput,
      password: HexletCode::Elements::StringInput,
      text: HexletCode::Elements::LongText,
      boolean: HexletCode::Elements::BooleanInput,
      select: HexletCode::Elements::Selection,
      submit: HexletCode::Elements::Button,
      reset: HexletCode::Elements::Button
    }.freeze

    def self.build(type, attributes)
      ELEMENT_TYPES[type].new(attributes)
    end
  end
end
