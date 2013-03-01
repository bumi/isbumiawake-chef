# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'isbumiawake/version'

Gem::Specification.new do |gem|
  gem.name          = "isbumiawake"
  gem.version       = Isbumiawake::VERSION
  gem.authors       = ["Michael Bumann"]
  gem.email         = ["michael@railslove.com"]
  gem.description   = %q{Isbumiawake gem to notify isbumiawake.com that your task is still running. Includes a Chef Handler and a Rake task}
  gem.summary       = %q{Isbumiawake gem to notify isbumiawake.com that your periodically running task is still awake}
  gem.homepage      = "http://github.com/bumi/isbumiawake"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("rest-client", ">=1.6.0")

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency("chef", ">= 0.9.0")
end
