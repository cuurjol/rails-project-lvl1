# frozen_string_literal: true

module HexletCode
  class FormTemplate
    attr_reader :form_builder, :attributes

    def initialize(form_builder, attributes)
      @form_builder = form_builder
      @attributes = attributes
    end

    def render
      elements = form_builder.elements.map do |element|
        if element.is_a?(HexletCode::Elements::Selection)
          rebuild_selection_element(element)
        else
          element.to_html
        end
      end

      value = "\n  #{elements.join('  ')}"
      Tag.build('form', **attributes) { value }
    end

    private

    def rebuild_selection_element(element)
      label, selection = element.to_html
      splited_selection = selection.split(/\n\s{0,2}(?=<)/)
      result = splited_selection.map { |str| str.match?(/option/) ? "  #{str}" : str }.join("\n  ")
      [label, result]
    end
  end
end
