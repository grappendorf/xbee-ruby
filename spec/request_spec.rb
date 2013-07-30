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

	describe Request do

		its(:frame_id) { should == 1 }
		its(:frame_id) { should_not == Request.new.frame_id }

		describe '#frame_data' do
			it 'should raise an exception because Request is abstract' do
				expect { subject.frame_data }.to raise_error
			end
		end

		describe '#packet' do
			before do
				allow(Request).to receive(:next_frame_id).and_return 1
				expect(subject).to receive(:frame_data).and_return [0x12, 0x34, 0x56]
				expect(subject).to receive(:frame_type).and_return 0xaa
			end
			its (:packet) { should == Packet.new([0xaa, 0x01, 0x12, 0x34, 0x56]) }
		end

	end

end
