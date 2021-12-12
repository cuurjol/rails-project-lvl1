# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'

module HexletCode
  class Error < StandardError; end

  def self.form_for(model, url: '#', &block)
    HexletCode::Tag.build('form', action: url, method: 'post')
  end
end
