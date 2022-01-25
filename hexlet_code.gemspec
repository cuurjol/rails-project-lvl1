# frozen_string_literal: true

require_relative 'lib/hexlet_code/version'

Gem::Specification.new do |spec|
  spec.name          = 'hexlet_code'
  spec.version       = HexletCode::VERSION
  spec.authors       = ['Kirill Ilyin']
  spec.email         = ['cuurjol@gmail.com']

  spec.summary       = 'Library for generating pretty simple forms in site templates.'
  spec.description   = <<~DESCRIPTION_MESSAGE
    A library with which it is convenient to create forms in site templates. Allows to reduce
    the form description code many times due to automatic error handling and various controls.
  DESCRIPTION_MESSAGE
  spec.homepage = 'https://github.com/cuurjol/rails-project-lvl1'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.0.0')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata = {
    'rubygems_mfa_required' => 'true',
    'homepage_uri' => spec.homepage,
    'source_code_uri' => 'https://github.com/cuurjol/rails-project-lvl1'
  }
end
