=begin

This file is part of the xbee-ruby gem.

Copyright 2013-2014 Dirk Grappendorf, www.grappendorf.net

Licensed under the The MIT License (MIT)

=end

require 'xbee-ruby/response'

module XBeeRuby


	class RxResponse < Response

		frame_type 0x90

		attr_reader :address64
		attr_reader :address16
		attr_reader :receive_options
		attr_reader :data

		def initialize bytes
			@address64 = Address64.new *bytes[1..8]
			@address16 = Address16.new *bytes[9..10]
			@receive_options = bytes[11]
			@data = bytes[12..-1]
		end

		def == other
			other.class == RxResponse && self.address64 == other.address64 &&
					self.address16 == other.address16 && self.receive_options == other.receive_options
		end

		def to_s
			"RxResponse[#{super}](address64=0x#{address64}, address16=0x#{address16}, receive_otions=#{receive_options})"
		end
	end

end

