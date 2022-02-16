# frozen_string_literal: true

module HexletCode
  module Elements
    class PasswordInput < Base
      FILTER_ATTRIBUTES = (%i[type value size maxlength] + BASE_ATTRIBUTES).freeze

      def to_html
        Tag.build('input', **attributes)
      end

      private

      def filter_attributes(attributes)
        attributes.slice(*FILTER_ATTRIBUTES)
      end
    end
  end
end
