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

	describe XBee do

		let!(:serial) { double('SerialPort').as_null_object }
		let!(:xbee) { XBee.new '/dev/ttyS0', 57600 }

		before { allow(SerialPort).to receive(:create).and_return serial }

		subject { xbee }

		describe '#open' do
			it 'should open the serial port with the correct settings' do
				expect(SerialPort).to receive(:create).with('/dev/ttyS0').and_return serial
				expect(serial).to receive(:set_modem_params).with(57600)
				xbee.open
			end
		end

		describe '#close' do
			it 'should close the serial port' do
				xbee.open
				expect(serial).to receive(:close)
				xbee.close
			end
		end

		describe '#write_packet' do
			it 'should send the given packet to the serial port' do
				expect(serial).to receive(:write).with [0x7e, 0x00, 0x04, 0x7d, 0x5e, 0x12, 0x34, 0x56,
																								0xe5].pack('C*').force_encoding('ascii')
				xbee.open
				xbee.write_packet Packet.new [0x7e, 0x12, 0x34, 0x56]
			end
		end

		describe '#write_request' do
			it 'should send the given request to the serial port' do
				allow(Request).to receive(:next_frame_id).and_return 1
				expect(serial).to receive(:write).with [0x7e, 0x00, 0x10, 0x10, 0x01, 0x01, 0x02, 0x03,
																								0x04, 0x05, 0x06, 0x07, 0x08, 0xff, 0xfe, 0x00,
																								0x00, 0x12, 0x34, 0x87].pack('C*').force_encoding('ascii')
				xbee.open
				xbee.write_request TxRequest.new Address64.new(0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08), [0x12, 0x34]
			end
		end

		describe '#read_packet' do

			it 'should read the next packet from the serial port' do
				expect(serial).to receive(:readbyte).and_return(0x7e, 0x00, 0x02, 0x12, 0x34, 0xb9)
				xbee.open
				xbee.read_packet.should == Packet.new([0x12, 0x34])
			end

			it 'should raise an error if the checksum is wrong' do
				expect(serial).to receive(:readbyte).and_return(0x7e, 0x00, 0x01, 0x12, 0x99)
				xbee.open
				expect { xbee.read_packet }.to raise_error IOError
			end

		end

		describe '#read_response' do

			it 'should read the next response from the serial port' do
				expect(serial).to receive(:readbyte).and_return(0x7e, 0x00, 0x07, 0x8b, 0x02, 0x79, 0x38, 0x00, 0x00, 0x00, 0xc1)
				xbee.open
				xbee.read_response.should == TxResponse.new([0x8b, 0x02, 0x79, 0x38, 0x00, 0x00, 0x00])
			end

		end

		describe '#connected?' do
			context 'if it is not connected' do
				its(:connected?) { should be_false }
			end

			context 'if it is connected' do
				before { xbee.open }
				its(:connected?) { should be_true }
			end

			context 'if it is connected and then closed' do
				before { xbee.open; xbee.close }
				its(:connected?) { should be_false }
			end
		end
	end

end
