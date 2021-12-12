# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[br img input].freeze

    def self.build(tag_name, **options, &block)
      tag_with_attributes = options.map { |k, v| "#{k}=\"#{v}\"" }.unshift(tag_name).join(' ')
      value = block.call if block_given?

      "<#{tag_with_attributes}>#{SINGLE_TAGS.include?(tag_name) ? '' : "#{value}</#{tag_name}>"}"
    end
  end
end
