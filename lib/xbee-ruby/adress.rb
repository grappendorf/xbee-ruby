=begin

This file is part of the xbee-ruby gem.

Copyright 2013-2014 Dirk Grappendorf, www.grappendorf.net

Licensed under the The MIT License (MIT)

=end

module XBeeRuby

	class Address

		def to_a
			raise 'Override to return the address as a byte array'
		end

	end

end