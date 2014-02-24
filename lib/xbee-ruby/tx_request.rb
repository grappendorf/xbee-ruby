=begin

This file is part of the xbee-ruby gem.

Copyright 2013-2014 Dirk Grappendorf, www.grappendorf.net

Licensed under the The MIT License (MIT)

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

