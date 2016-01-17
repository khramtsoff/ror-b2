#!/usr/bin/ruby

require_relative 'wagon'

class PassengerWagon < Wagon
	def initialize
		@type = Train::PASSENGER
	end
end
