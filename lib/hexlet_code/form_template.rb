# frozen_string_literal: true

module HexletCode
  class FormTemplate
    class << self
      def render(form_builder, form_attributes)
        controls = form_builder.elements.map { |element| render_element(element) }
        string_controls = controls.join.split(/\n\s{0,2}(?=<)/)
        string_result = string_controls.map { |str| str.match?(/option/) ? "  #{str}" : str }.join("\n  ")
        value = "\n  #{string_result}"
        Tag.build('form', **form_attributes) { value }
      end

      private

      def render_element(element)
        return element.to_html if element.is_a?(HexletCode::Elements::Button)

        wrap_with_label(element)
      end

      def wrap_with_label(element)
        input = element.to_html
        label_value = element.attributes[:name].to_s.split('_').map(&:capitalize).join(' ')
        label = Tag.build('label', for: element.attributes[:name]) { label_value }
        element.is_a?(HexletCode::Elements::BooleanInput) ? [input, label] : [label, input]
      end
    end
  end
end
