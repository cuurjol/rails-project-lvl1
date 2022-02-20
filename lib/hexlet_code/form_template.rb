# frozen_string_literal: true

module HexletCode
  class FormTemplate
    class << self
      def render(form_builder)
        Tag.build('form', **form_builder.form_attributes) do
          form_builder.elements.map do |element_attributes|
            case element_attributes[:type]
            when :submit, :reset then render_button(element_attributes)
            else render_element(element_attributes)
            end
          end.join
        end
      end

      private

      def render_element(attributes)
        element_template = [render_label(attributes), render_input(attributes)]
        element_template.reverse! if attributes[:type] == :boolean
        element_template.join
      end

      def render_label(attributes)
        label_value = attributes[:name].to_s.split('_').map(&:capitalize).join(' ')
        Tag.build('label', indent_level: 1, for: attributes[:name]) { label_value }
      end

      def render_input(attributes)
        type = "#{attributes[:type].to_s.capitalize}Input"
        HexletCode::Elements.const_get(type).new(attributes).to_html(1)
      end

      def render_button(attributes)
        HexletCode::Elements::Button.new(attributes).to_html(1)
      end
    end
  end
end
