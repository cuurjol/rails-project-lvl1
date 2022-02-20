# frozen_string_literal: true

module HexletCode
  module Elements
    class TextInput < Base
      FILTER_ATTRIBUTES = (%i[rows cols] + BASE_ATTRIBUTES).freeze

      attr_reader :text_value

      def initialize(attributes = {})
        super
        @text_value = attributes[:value]
      end

      def to_html(indent_level = 0)
        Tag.build('textarea', indent_level: indent_level, **attributes) { text_value }
      end

      private

      def filter_attributes(attributes)
        attributes.slice(*FILTER_ATTRIBUTES)
      end
    end
  end
end
