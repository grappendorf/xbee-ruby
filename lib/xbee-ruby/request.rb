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

