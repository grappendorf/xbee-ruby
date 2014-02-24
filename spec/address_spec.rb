=begin

This file is part of the xbee-ruby gem.

Copyright 2013-2014 Dirk Grappendorf, www.grappendorf.net

Licensed under the The MIT License (MIT)

=end

require 'spec_helper'

module XBeeRuby

	describe Address do

		describe '#to_a' do
			it 'should raise an exception because XBeeAddress is abstract' do
				expect { subject.to_a }.to raise_error
			end
		end

	end

end
