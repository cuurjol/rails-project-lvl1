# frozen_string_literal: true

module HexletCode
  module Elements
    class LongText < Base
      FILTER_ATTRIBUTES = (%i[rows cols] + BASE_ATTRIBUTES).freeze

      attr_reader :text_value

      def initialize(attributes = {})
        @text_value = attributes.delete(:value)
        super
      end

      def to_html
        textarea = Tag.build('textarea', **attributes) { text_value }
        label_value = attributes[:name].to_s.split('_').map(&:capitalize).join(' ')
        label = Tag.build('label', for: attributes[:name]) { label_value }
        [label, textarea]
      end

      private

      def filter_attributes(attributes)
        attributes.slice(*FILTER_ATTRIBUTES)
      end
    end
  end
end
