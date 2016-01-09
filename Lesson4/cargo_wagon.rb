#!/usr/bin/ruby

require_relative 'wagon'

class CargoWagon < Wagon
	def initialize
		type = Train::CARGO
	end
end
