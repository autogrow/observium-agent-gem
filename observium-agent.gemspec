# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'observium/agent/version'

Gem::Specification.new do |spec|
  spec.name          = "observium-agent"
  spec.version       = Observium::Agent::VERSION
  spec.authors       = ["Robert McLeod"]
  spec.email         = ["robert@autogrow.com"]
  spec.summary       = %q{Ruby gem to interface with Observium Agents}
  spec.description   = %q{Interface with Observium Agents using ruby to gather system information}
  spec.homepage      = "https://github.com/AutogrowSystems/observium-agent-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
