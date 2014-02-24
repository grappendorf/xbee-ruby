=begin

This file is part of the xbee-ruby gem.

Copyright 2013-2014 Dirk Grappendorf, www.grappendorf.net

Licensed under the The MIT License (MIT)

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
