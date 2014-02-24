=begin

This file is part of the xbee-ruby gem.

Copyright 2013-2014 Dirk Grappendorf, www.grappendorf.net

Licensed under the The MIT License (MIT)

=end

require 'spec_helper'

module XBeeRuby

	describe TxResponse do

		subject { TxResponse.new [0x8b, 0x1, 0xab, 0xcd, 0x02, 0x03, 0x04] }

		its(:frame_id) { should == 0x01 }
		its(:address16) { should == Address16.new(0xab, 0xcd) }
		its(:retry_count) { should == 0x02 }
		its(:delivery_status) { should == 0x03 }
		its(:discovery_status) { should == 0x04 }

		describe 'can be reconstructed from a packet' do
			it { should == Response.from_packet(Packet.new [0x8b, 0x1, 0xab, 0xcd, 0x02, 0x03, 0x04]) }
		end

	end

end
