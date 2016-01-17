#!/usr/bin/ruby

require_relative 'train'
require_relative 'producer'

class Wagon
	include Producer
	
	attr_accessor :type
	
	def initialize(type)
		@type = type
	end
end
