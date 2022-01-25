# frozen_string_literal: true

module HexletCode
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:VERSION, 'hexlet_code/version.rb')

  class Error < StandardError; end

  def self.form_for(model, url: '#', &block)
    Tag.build('form', action: url, method: 'post') { block.call(FormBuilder.new(model)).join }
  end
end
