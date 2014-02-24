=begin

This file is part of the xbee-ruby gem.

Copyright 2013-2014 Dirk Grappendorf, www.grappendorf.net

Licensed under the The MIT License (MIT)

=end

require 'spec_helper'

module XBeeRuby

	describe Response do

		describe 'raises an error if an unknown packet should be decoded' do
			specify { expect { Response.from_packet(Packet.new [0x00, 0x1, 0x02, 0x03]) }.to raise_error IOError }
		end

	end

end
