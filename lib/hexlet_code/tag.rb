# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[br img input].freeze
    OUTLINE_TAGS = %w[div form select].freeze

    def self.build(tag_name, indent_level: 0, **options)
      attributes = options.map { |k, v| v == true ? k : "#{k}=\"#{v}\"" }.join(' ')
      spaces = ' ' * 2 * indent_level
      return "#{spaces}<#{tag_name} #{attributes}>\n" if SINGLE_TAGS.include?(tag_name)

      value = yield if block_given?
      if OUTLINE_TAGS.include?(tag_name)
        "#{spaces}<#{tag_name} #{attributes}>\n#{value}#{spaces}</#{tag_name}>\n"
      else
        "#{spaces}<#{tag_name} #{attributes}>#{value}</#{tag_name}>\n"
      end
    end
  end
end
