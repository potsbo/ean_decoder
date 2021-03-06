# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ean_decoder/version'

Gem::Specification.new do |spec|
  spec.name          = "ean_decoder"
  spec.version       = EanDecoder::VERSION
  spec.authors       = ["Shimpei Otsubo"]
  spec.email         = ["potsbo@gmail.com"]

  spec.summary       = %q{Decode EAN to identify country and manufacturer}
  spec.description   = %q{Decode EAN to identify country and manufacturer}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
