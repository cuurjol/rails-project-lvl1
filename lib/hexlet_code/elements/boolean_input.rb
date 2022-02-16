# frozen_string_literal: true

module HexletCode
  module Elements
    class BooleanInput < Base
      FILTER_ATTRIBUTES = (%i[type value checked] + BASE_ATTRIBUTES).freeze

      def to_html
        Tag.build('input', **attributes)
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