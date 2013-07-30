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

require 'xbee-ruby/request'

module XBeeRuby

	class TxRequest < Request

		attr_reader :address64
		attr_reader :address16
		attr_reader :data
		attr_reader :options
		attr_reader :radius

		def initialize address64, data, opt = {}
			super 0x10
			@address64 = address64
			@data = data
			@frame_id = Request.next_frame_id
			@address16 = opt[:address16] || Address16::BROADCAST
			@options = opt[:options] || 0
			@radius = opt[:radius] || 0
		end

		def frame_data
			@address64.to_a + @address16.to_a + [@radius, @options] + @data
		end

	end

end

