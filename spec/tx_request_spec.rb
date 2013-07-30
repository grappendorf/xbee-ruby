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

	describe TxRequest do

		subject { TxRequest.new Address64.new(0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88), [0x12, 0x34] }

		its(:frame_type) { should == 0x10 }
		its(:address64) { should == Address64.new(0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88) }
		its(:address16) { should == Address16::BROADCAST }
		its(:data) { should == [0x12, 0x34] }
		its(:options) { should == 0 }
		its(:radius) { should == 0 }
		its(:frame_data) { should == [0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0xff, 0xfe, 0x00, 0x00, 0x12, 0x34]}

		describe 'if :options is specified' do
			subject { TxRequest.new Address64::BROADCAST, [], options: 0xab }
			its(:options) { should == 0xab }
		end

		describe 'if :radius are specified' do
			subject { TxRequest.new Address64::BROADCAST, [], radius: 123 }
			its(:radius) { should == 123 }
		end

	end

end
