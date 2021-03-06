lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pah/version'

Gem::Specification.new do |spec|
  spec.name          = 'pah'
  spec.version       = Pah::VERSION
  spec.authors       = ['HE:labs']
  spec.email         = ['contato@helabs.com.br']
  spec.description   = 'A rails application template which born from Startup DEV and now is used to start most projects at HE:labs.'
  spec.summary       = 'A rails application template which born from Startup DEV and now is used to start most projects at HE:labs.'
  spec.homepage      = 'https://github.com/Helabs/pah'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.required_ruby_version = ">= #{Pah::RUBY_VERSION}"

  spec.add_dependency 'rails', Pah::RAILS_VERSION
  spec.add_dependency 'colored', '1.2'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'thor'
  spec.add_development_dependency 'pry'
end
