# frozen_string_literal: true

module HexletCode
  module Elements
    class Base
      BASE_ATTRIBUTES = %i[name id class style].freeze

      attr_reader :attributes

      def initialize(attributes = {})
        @attributes = filter_attributes(attributes)
      end
    end
  end
end
