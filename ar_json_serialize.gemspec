# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ar_json_serialize/version'

Gem::Specification.new do |spec|
  spec.name          = "ar_json_serialize"
  spec.version       = ArJsonSerialize::VERSION
  spec.authors       = ["Alexander Simonov"]
  spec.email         = ["alex@simonov.me"]
  spec.description   = %q{ActiveRecord JSON serializer}
  spec.summary       = %q{ActiveRecord JSON serializer}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'multi_json', '~> 1.0'
  spec.add_dependency 'hashie', '~> 2.0.5'
  spec.add_dependency 'activerecord', '>= 3.2.13', '< 5'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
