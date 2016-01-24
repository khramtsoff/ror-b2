#!/usr/bin/ruby

require_relative 'train'
require_relative 'producer'

class Wagon
	include Producer
	
	attr_accessor :type, :total_seats
	attr_reader :taken_seats
	
	def initialize(type, total_seats)
		@type = type
		@seats_count = total_seats
		
		validate!
	end
	
	def valid?
		validate!
	rescue 
		false
	end
	
	def take_seat
		self.taken_seats += 1 if self.taken_seats <  self.total_seats
	end
	
	def free_seats
		self.total_seats - self.taken_seats
	end
	
	protected 
	
	attr_writer :taken_seats
	
	def validate!
		raise "type" if type.to_s == ''
		true
	end
end
