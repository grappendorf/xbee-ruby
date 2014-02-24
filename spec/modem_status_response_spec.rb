=begin

This file is part of the xbee-ruby gem.

Copyright 2013-2014 Dirk Grappendorf, www.grappendorf.net

Licensed under the The MIT License (MIT)

=end

require 'spec_helper'

module XBeeRuby

	describe ModemStatusResponse do

		subject { ModemStatusResponse.new [0x8a, 0x12] }

		its(:modem_status) { should == 0x12 }

		describe 'can be reconstructed from a packet' do
			it { should == Response.from_packet(Packet.new [0x8a, 0x12]) }
		end

	end

end
