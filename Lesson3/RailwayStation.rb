#!/usr/bin/ruby

class RailwayStation
	attr_reader :name
	attr_reader :trains
	
	# Имеет название, которое указывается при ее создании
	def initialize(name)
		@name = name    
		@trains = []
	end
	
	# Может показывать список всех поездов на станции, находящиеся в текущий момент
	def show_trains
		puts self.trains
	end
	
	
	# Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
	def show_trains_by_type
		number_of_cargo = self.trains.select{ |t| t.type == Train.CARGO}.size
		number_of_pass = self.trains.select{ |t| t.type == Train.PASSENGER}.size
		
		puts "cargo - #{number_of_cargo}, passenger - #{number_of_pass}"
	end
	
	# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
	def remove_train(train)
		self.trains -= [train]
	end
	
	# Может принимать поезда (по одному за раз)
	def add_train(train)
		self.trains << train
	end
	
end