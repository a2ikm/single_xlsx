# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'single_xlsx/version'

Gem::Specification.new do |spec|
  spec.name          = "single_xlsx"
  spec.version       = SingleXLSX::VERSION
  spec.authors       = ["Masato Ikeda"]
  spec.email         = ["masato.ikeda@gmail.com"]
  spec.summary       = %q{rubyXL wrapper to treat single-sheet XLSX files like CSV.}
  spec.description   = %q{rubyXL wrapper to treat single-sheet XLSX files like CSV.}
  spec.homepage      = "https://github.com/a2ikm/single_xlsx"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_dependency "rubyXL", "~> 3.2.6"
  spec.add_dependency "activesupport", ">= 3.2.0"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-reporters"
end
