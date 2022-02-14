# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[br img input].freeze

    def self.build(tag_name, **options)
      tag_with_attributes = options.map { |k, v| v == true ? k : "#{k}=\"#{v}\"" }.unshift(tag_name).join(' ')
      value = yield if block_given?

      "<#{tag_with_attributes}>#{SINGLE_TAGS.include?(tag_name) ? "\n" : "#{value}</#{tag_name}>\n"}"
    end
  end
end
