# frozen_string_literal: true

module HexletCode
  module Elements
    class BooleanInput < Base
      FILTER_ATTRIBUTES = (%i[type value checked] + BASE_ATTRIBUTES).freeze

      def initialize(attributes = {})
        super
        @attributes[:type] = :checkbox
        @attributes[:checked] = attributes[:value] == true
        @attributes[:value] = attributes[:value].to_s
      end

      def to_html(indent_level = 0)
        Tag.build('input', indent_level: indent_level, **attributes)
      end

      private

      def filter_attributes(attributes)
        attributes.slice(*FILTER_ATTRIBUTES)
      end
    end
  end
end
