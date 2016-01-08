#!/usr/bin/ruby

class RailwayStation
	attr_reader :name, trains
	
	def initialize(name)
		@name = name    
		@trains = []
	end
	
	def show_trains
		puts self.trains
	end
	
	def show_trains_by_type
		number_of_cargo = self.trains.select{ |t| t.type == Train.CARGO}.size
		number_of_pass = self.trains.select{ |t| t.type == Train.PASSENGER}.size
		
		puts "cargo - #{number_of_cargo}, passenger - #{number_of_pass}"
	end
	
	def remove_train(train)
		self.trains -= [train]
	end
	
	def add_train(train)
		self.trains << train
	end
	
end