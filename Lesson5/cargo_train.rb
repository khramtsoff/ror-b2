#!/usr/bin/ruby

require_relative 'train'

class CargoTrain <  Train
	def initialize
		@type = Train::CARGO
	end
end
