=begin

This file is part of the xbee-ruby gem.

Copyright 2013-2014 Dirk Grappendorf, www.grappendorf.net

Licensed under the The MIT License (MIT)

=end

require 'xbee-ruby/adress'

module XBeeRuby

	class Address16 < Address

		def initialize msb, lsb
			@address = [msb, lsb]
		end

		def self.from_s string
			if matcher = /^(\h\h)[^\h]*(\h\h)$/.match(string)
				self.new *(matcher[1..2].map &:hex)
			else
				raise ArgumentError, "#{string} is not a valid 16-bit address string"
			end
		end

		def self.from_a array
			if array.length == 2 && array.all? {|x| (0..255).cover? x }
				self.new *array
			else
				raise ArgumentError, "#{array} is not a valid 16-bit address array"
			end
		end

		def to_s
			'%02x%02x' % @address
		end

		def to_a
			@address
		end

		def == other
			to_a == other.to_a
		end

		BROADCAST = Address16.new 0xff, 0xfe

	end

end