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

	class Response

		@@response_types = {}

		def self.frame_type type
			@@response_types[type] = self
		end

		def self.from_packet packet
			@@response_types[packet.data[0]].new packet.data rescue raise IOError, "Unknown response type 0x#{packet.data[0].to_s 16}"
		end

		attr_reader :frame_id

		def initialize frame_id
			@frame_id = frame_id
		end

		def to_s
			"Request(frame_id=#{frame_id})"
		end

	end

end

