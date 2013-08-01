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

	describe Address16 do

		subject { Address16.new 0x12, 0x34 }

		describe '#to_s' do
			its(:to_s) { should == '1234' }
		end

		describe '::from_s' do
			describe 'with a valid address string' do
				subject { Address16.from_s '1a2B' }
				its(:to_a) { should == [0x1a, 0x2b] }
			end

			describe 'with a valid address string with separators' do
				subject { Address16.from_s '1a:2B' }
				its(:to_a) { should == [0x1a, 0x2b] }
			end

			describe 'with an invalid address string' do
				specify { expect { Address16.from_s '' }.to raise_error ArgumentError }
				specify { expect { Address16.from_s '12' }.to raise_error ArgumentError }
				specify { expect { Address16.from_s '12:34:56' }.to raise_error ArgumentError }
				specify { expect { Address16.from_s 'bad' }.to raise_error ArgumentError }
			end
		end

		describe '::from_a' do
			describe 'with a valid address array' do
				subject { Address16.from_a [0x98, 0x76] }
				its(:to_a) { should == [0x98, 0x76] }
			end

			describe 'with an invalid address array' do
				specify { expect { Address16.from_a [] }.to raise_error ArgumentError }
				specify { expect { Address16.from_a [0] }.to raise_error ArgumentError }
				specify { expect { Address16.from_a [0, 256] }.to raise_error ArgumentError }
			end
		end

		describe '#==' do
			it { should == Address16.new(0x12, 0x34) }
		end

		describe '::BROADCAST' do
			specify { Address16::BROADCAST.should == Address16.new(0xff, 0xfe)}
		end

	end

end