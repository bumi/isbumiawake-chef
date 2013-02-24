# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'isbumiawake/chef/version'

Gem::Specification.new do |gem|
  gem.name          = "isbumiawake-chef"
  gem.version       = Isbumiawake::Chef::VERSION
  gem.authors       = ["Michael Bumann"]
  gem.email         = ["michael@railslove.com"]
  gem.description   = %q{Chef Handler to notify isbumiawake to track if the peritically chef run is running}
  gem.summary       = %q{Chef Handler to notify isbumiawake}
  gem.homepage      = "http://github.com/bumi/isbumiawake-chef"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("chef", ">= 0.9.0")
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
end
