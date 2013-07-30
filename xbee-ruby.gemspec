=begin

This file is part of the xbee-ruby gem.

Copyright 2013 Dirk Grappendorf, www.grappendorf.net

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xbee-ruby/version'

Gem::Specification.new do |spec|
	spec.name = 'xbee-ruby'
	spec.version = XBeeRuby::VERSION
	spec.description = 'A Ruby API for Digi XBee RF Modules'
	spec.summary = 'A Ruby API for Digi XBee RF Modules'
	spec.authors = 'Dirk Grappendorf (http://www.grappendorf.net)'
	spec.license = 'GNU GPL v3'

	spec.files = Dir.glob('lib/**/*.{rb,yml}') + Dir.glob('vendor/**/*.*')
	spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
	spec.require_paths = %w(lib)

	spec.add_development_dependency 'bundler'
	spec.add_development_dependency 'rake'
	spec.add_development_dependency 'rspec'
	spec.add_development_dependency 'simplecov'

	spec.add_dependency 'serialport', '>= 1.1.0'
end
