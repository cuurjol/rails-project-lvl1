# frozen_string_literal: true

module HexletCode
  module Elements
    class Button < Base
      FILTER_ATTRIBUTES = (%i[type value] + BASE_ATTRIBUTES).freeze

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
