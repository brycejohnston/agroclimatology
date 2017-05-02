# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'agroclimatology/version'

Gem::Specification.new do |spec|
  spec.name          = "agroclimatology"
  spec.version       = Agroclimatology::VERSION
  spec.authors       = ["Bryce Johnston"]
  spec.email         = ["bjohnston@cropquest.com"]
  spec.summary       = %q{Ruby client for interacting with the NASA (POWER) Agroclimatology Web Resource}
  spec.description   = %q{Ruby client for interacting with the NASA (POWER) Agroclimatology Web Resource}
  spec.homepage      = "https://github.com/CropQuest/agroclimatology"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.13.7"
  spec.add_dependency "oj", "~> 2.15"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
