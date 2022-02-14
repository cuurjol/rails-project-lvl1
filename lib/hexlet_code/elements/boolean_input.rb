# frozen_string_literal: true

module HexletCode
  module Elements
    class BooleanInput < Base
      FILTER_ATTRIBUTES = (%i[type value checked] + BASE_ATTRIBUTES).freeze

      def to_html
        input = Tag.build('input', **attributes)
        label_value = attributes[:name].to_s.split('_').map(&:capitalize).join(' ')
        label = Tag.build('label', for: attributes[:name]) { label_value }
        [input, label]
      end

      private

      def filter_attributes(attributes)
        attributes[:type] = :checkbox
        attributes[:checked] = attributes[:value] == true
        attributes[:value] = attributes[:value].to_s
        attributes.slice(*FILTER_ATTRIBUTES)
      end
    end
  end
end
