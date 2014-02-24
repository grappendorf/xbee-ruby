=begin

This file is part of the xbee-ruby gem.

Copyright 2013-2014 Dirk Grappendorf, www.grappendorf.net

Licensed under the The MIT License (MIT)

=end

module XBeeRuby

	class Request

		@@frame_id = 1

		def self.next_frame_id
			@@frame_id.tap do |id|
				@@frame_id = (id + 1) % 256
			end
		end

		attr_reader :frame_id
		attr_reader :frame_type

		def initialize frame_type = 0
			@frame_id = Request.next_frame_id
			@frame_type = frame_type
		end

		def frame_data
			raise 'Override to return frame data as a byte array'
		end

		def packet
			Packet.new([frame_type, frame_id] + frame_data)
		end

	end

end

