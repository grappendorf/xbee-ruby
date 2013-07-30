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

require 'rspec/mocks/standalone'
require_relative '../lib/xbee-ruby'

serial = double('SerialPort').as_null_object
allow(SerialPort).to receive(:create).and_return serial
xbee = XBeeRuby::XBee.new '/dev/ttyS0', 57600
xbee.open
num_reads = 0
start_time = Time.now.to_f
end_time = start_time + 10
puts 'Reading responses from a faked serial connection for 10 seconds'
while Time.now.to_f < end_time
	expect(serial).to receive(:readbyte).and_return(0x7e, 0x00, 0x07, 0x8b, 0x02, 0x79, 0x38, 0x00, 0x00, 0x00, 0xc1)
	xbee.read_response
	num_reads += 1
end
puts 'Done'
puts "#{num_reads / 10.0} per second"
