# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bibliografia/version'

Gem::Specification.new do |spec|
  spec.name          = "bibliografia"
  spec.version       = Bibliografia::VERSION
  spec.authors       = ["Alejandro Marrero Díaz", "David Pérez Rivero"]
  spec.email         = ["alexmd54@gmail.com", " "]


  spec.summary       = %q{Clase para describir unaBibliografia en Ruby.}
  spec.description   = %q{Desarrollo de una clase en lenguaje Ruby para describir una bibliografia como práctica para la asignatura LPP de la ULL.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.11"
end
