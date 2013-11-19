# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prct09/version'

Gem::Specification.new do |spec|
  spec.name          = "prct09"
  spec.version       = Prct09::VERSION
  spec.authors       = ["Yeray Hernandez", "Sergio Oramas"]
  spec.email         = ["alu0100435771@ull.edu.es", "alu0100603231@ull.edu.es"]
  spec.description   = %q{Aplicación que contempla la creacion de matrices, dispersas y densas}
  spec.summary       = %q{Aplicación para creacion de matrices}
  spec.homepage      = "https://github.com/alu0100435771/prct09"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
end
