=begin

This file is part of the xbee-ruby gem.

Copyright 2013-2014 Dirk Grappendorf, www.grappendorf.net

Licensed under the The MIT License (MIT)

=end

require 'xbee-ruby/response'

module XBeeRuby

	class ModemStatusResponse < Response

		frame_type 0x8a

		attr_reader :modem_status

		def initialize bytes
			@modem_status = bytes[1]
		end

		def == other
			other.class == ModemStatusResponse && self.modem_status == other.modem_status
		end

		def to_s
			"ModemStatusResponse[#{super}](modem_status=0x#{modem_status})"
		end
	end

end
