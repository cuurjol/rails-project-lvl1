# frozen_string_literal: true

module HexletCode
  module Elements
    class TextInput < Base
      FILTER_ATTRIBUTES = (%i[rows cols] + BASE_ATTRIBUTES).freeze

      attr_reader :text_value

      def initialize(attributes = {})
        @text_value = attributes.delete(:value)
        super
      end

      def to_html
        Tag.build('textarea', **attributes) { text_value }
      end

      private

      def filter_attributes(attributes)
        attributes.slice(*FILTER_ATTRIBUTES)
      end
    end
  end
end
