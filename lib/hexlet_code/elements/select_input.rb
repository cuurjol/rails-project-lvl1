# frozen_string_literal: true

module HexletCode
  module Elements
    class SelectInput < Base
      FILTER_ATTRIBUTES = (BASE_ATTRIBUTES + %i[size multiple]).freeze

      attr_reader :options, :selected_values

      def initialize(attributes = {})
        super
        @options = attributes[:options] || []
        @selected_values = attributes[:value] || []
      end

      def to_html(indent_level = 0)
        value = options.map { |option| build_option(option, indent_level + 1) }.join
        Tag.build('select', indent_level: indent_level, **attributes) { value }
      end

      private

      def filter_attributes(attributes)
        attributes.slice(*FILTER_ATTRIBUTES)
      end

      def build_option(value, indent_level)
        attributes = {}
        attributes[:value] = value
        attributes[:selected] = true if selected_values.include?(value)
        Tag.build('option', indent_level: indent_level, **attributes) { value }
      end
    end
  end
end
