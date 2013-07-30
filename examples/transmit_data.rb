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

require_relative '../lib/xbee-ruby'

xbee = XBeeRuby::XBee.new '/dev/ttyUSB0', 57600
xbee.open
request = XBeeRuby::TxRequest.new  XBeeRuby::Address64.new(0x00, 0x13, 0xa2, 0x00, 0x40, 0x4a, 0x50, 0x0c), [0x05, 0x00, 0x06]
xbee.write_request request
puts xbee.read_response
xbee.close
