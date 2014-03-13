XBee Ruby
=========

A Ruby API for XBee ZigBee-RF-Modules
-------------------------------------

I developed this gem for my CoYoHo Home Automation System. Only a small part of the XBee-API is currently
implemented. Especially only Series-2 modules in API-mode 2 and a subset of the available frame types are
supported.

Example: Transmit a packet to another node
------------------------------------------

	xbee = XBeeRuby::XBee.new port: '/dev/ttyUSB0', rate: 57600
	xbee.open
	request = XBeeRuby::TxRequest.new  XBeeRuby::Address64.new(0x00, 0x13, 0xa2, 0x00, 0x40, 0x4a, 0x50, 0x0c), [0x12, 0x34, 0x56]
	xbee.write_request request
	puts xbee.read_response
	xbee.close

Example: Receive packets
------------------------

	xbee = XBeeRuby::XBee.new port: '/dev/ttyUSB0', rate: 57600
	xbee.open
	while true do
		response = xbee.read_response
		case response
			when XBeeRuby::RxResponse
				puts "Received from #{response.address64}: #{response.data}"
			else
				puts "Other response: #{response}"
		end
	end

Supported frame types
---------------------

### Requests

* 0x10 TxRequest

### Responses

* 0x8b TxResponse
* 0x90 RxResponse

License
-------

The xbee-ruby code is licensed under the the MIT License

You find the license in the attached LICENSE.txt file
