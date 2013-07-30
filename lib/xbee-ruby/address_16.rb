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

		def to_a
			@address
		end

		def == other
			to_a == other.to_a
		end

		def to_s
			"Address16(0x#{@address[0].to_s 16}, 0x#{@address[1].to_s 16})"
		end

		BROADCAST = Address16.new 0xff, 0xfe

	end

end