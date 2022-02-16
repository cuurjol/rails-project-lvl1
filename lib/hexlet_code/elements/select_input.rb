# frozen_string_literal: true

module HexletCode
  module Elements
    class SelectInput < Base
      FILTER_ATTRIBUTES = (BASE_ATTRIBUTES + %i[size multiple]).freeze

      attr_reader :options, :selected_values

      def initialize(attributes = {})
        @options = attributes.delete(:options) || []
        @selected_values = attributes.delete(:value) || []
        super
      end

      def to_html
        value = "\n  #{options.map { |option| build_option(option) }.join('  ')}"
        Tag.build('select', **attributes) { value }
      end

      private

      def filter_attributes(attributes)
        attributes.slice(*FILTER_ATTRIBUTES)
      end

      def build_option(value)
        attributes = {}
        attributes[:value] = value
        attributes[:selected] = true if selected_values.include?(value)
        Tag.build('option', **attributes) { value }
      end
    end
  end
end
