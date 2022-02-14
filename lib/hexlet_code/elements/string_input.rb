# frozen_string_literal: true

module HexletCode
  module Elements
    class StringInput < Base
      FILTER_ATTRIBUTES = (%i[type value size maxlength] + BASE_ATTRIBUTES).freeze

      def to_html
        input = Tag.build('input', **attributes)
        label_value = attributes[:name].to_s.split('_').map(&:capitalize).join(' ')
        label = Tag.build('label', for: attributes[:name]) { label_value }
        [label, input]
      end

      private

      def filter_attributes(attributes)
        attributes[:type] = :text if attributes[:type] == :string
        attributes.slice(*FILTER_ATTRIBUTES)
      end
    end
  end
end
