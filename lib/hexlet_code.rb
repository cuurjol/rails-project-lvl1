# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/form_builder'

module HexletCode
  class Error < StandardError; end

  def self.form_for(model, url: '#', &block)
    Tag.build('form', action: url, method: 'post') { block.call(FormBuilder.new(model)).join }
  end
end
