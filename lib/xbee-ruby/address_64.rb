=begin

This file is part of the xbee-ruby gem.

Copyright 2013-2014 Dirk Grappendorf, www.grappendorf.net

Licensed under the The MIT License (MIT)

=end

require 'xbee-ruby/adress'

module XBeeRuby

	class Address64 < Address

		def initialize b1, b2, b3, b4, b5, b6, b7, b8
			@address = [b1, b2, b3, b4, b5, b6, b7, b8]
		end

		def self.from_s string
			if matcher = /^(\h\h)[^\h]*(\h\h)[^\h]*(\h\h)[^\h]*(\h\h)[^\h]*(\h\h)[^\h]*(\h\h)[^\h]*(\h\h)[^\h]*(\h\h)$/.match(string)
				self.new *(matcher[1..8].map &:hex)
			else
				raise ArgumentError, "#{string} is not a valid 64-bit address string"
			end
		end

		def self.from_a array
			if array.length == 8 && array.all? {|x| (0..255).cover? x }
				self.new *array
			else
				raise ArgumentError, "#{array} is not a valid 64-bit address array"
			end
		end

		def to_a
			@address
		end

		def == other
			to_a == other.to_a
		end

		def to_s
			('%02x' * 8) % @address
		end

		BROADCAST = Address64.new 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff
		COORDINATOR = Address64.new 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	end

end