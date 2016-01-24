#!/usr/bin/ruby

require_relative 'train'
require_relative 'producer'

class Wagon
	include Producer
	
	attr_accessor :type
	attr_accessor :seats_count
	
	def initialize(type, seats_count)
		@type = type
		@seats_count = seats_count
		
		validate!
	end
	
	def valid?
		validate!
	rescue 
		false
	end
	
	protected 
	
	def validate!
		raise "type" if type.to_s == ''
		true
	end
end
