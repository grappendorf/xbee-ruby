=begin

This file is part of the xbee-ruby gem.

Copyright 2013-2014 Dirk Grappendorf, www.grappendorf.net

Licensed under the The MIT License (MIT)

=end

require 'xbee-ruby/response'

module XBeeRuby

	class TxResponse < Response

		frame_type 0x8b

		attr_reader :frame_id
		attr_reader :address16
		attr_reader :retry_count
		attr_reader :delivery_status
		attr_reader :discovery_status

		def initialize bytes
			@frame_id = bytes[1]
			@address16 = Address16.new *bytes[2..3]
			@retry_count = bytes[4]
			@delivery_status = bytes[5]
			@discovery_status = bytes[6]
		end

		def == other
			other.class == TxResponse && self.address16 == other.address16 &&
					self.retry_count == other.retry_count && self.delivery_status == other.delivery_status &&
					self.discovery_status == other.discovery_status
		end

		def to_s
			"TxResponse[#{super}](address16=0x#{address16}, retry_count=#{retry_count}, " +
					"delivery_status=#{delivery_status}, discovery_status=#{discovery_status})"
		end
	end

end

