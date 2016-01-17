#!/usr/bin/ruby

class RailwayStation
	@@stations = []

	attr_reader :name, :trains
	
	def initialize(name)
		@name = name    
		@trains = []
		@@stations << self
	end
	
	def show_trains
		puts self.trains
	end
	
	def show_number_of_trains(type)
		puts self.trains.select{ |t| t.type == type}.size
	end
	
	def remove_train(train)
		self.trains -= [train]
	end
	
	def add_train(train)
		self.trains << train
	end
	
		
	def self.all
	end
end