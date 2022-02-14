# frozen_string_literal: true

module HexletCode
  class FormTemplate
    attr_reader :form_builder, :attributes

    def initialize(form_builder, attributes)
      @form_builder = form_builder
      @attributes = attributes
    end

    def render
      string_elements = form_builder.elements.map(&:to_html).join.split(/\n\s{0,2}(?=<)/)
      string_result = string_elements.map { |str| str.match?(/option/) ? "  #{str}" : str }.join("\n  ")
      value = "\n  #{string_result}"
      Tag.build('form', **attributes) { value }
    end
  end
end
