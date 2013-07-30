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
