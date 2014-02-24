=begin

This file is part of the xbee-ruby gem.

Copyright 2013-2014 Dirk Grappendorf, www.grappendorf.net

Licensed under the The MIT License (MIT)

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
