#!/usr/bin/ruby

require_relative 'producer'

class Train
	include Producer

	CARGO = "cargo"
	PASSENGER = "passenger"  

	attr_accessor :route
	attr_reader :length, :route_index, :speed, :type
	
	@@trains = []
	
	def self.all
		puts @@trains
	end
	
	def self.find(index)
		index.to_i!
		@@trains[index] if index >=0 and index < @@trains.size
	end
	
	def initialize(type, length)
		@type = type
		@length = [0, length].max 
		@speed = speed
		@@trains << self
	end

	def stop
		self.speed = 0
	end
	
	def speed_up(delta)
		self.speed += delta;
	end

	def speed_down(delta)
		self.speed -= delta;
	end

	def add_wagon(wagon=Wagon.new(self.type))
		self.length += 1 if self.speed == 0 && wagon.type == self.type
	end

	def remove_wagon
		self.length -= 1 if self.speed == 0 and self.length > 0
	end

	def next_station
		self.route_index += 1 if self.route != nil and self.route.stations.length < self.length - 1
	end

	def route=(route)
		@route = route
		self.route_index = 0
	end
	
	def route_index=(route_index)
		@route_index = route_index
		self.route[route_index].current_train = self
	end

	def route_description
		if route
			prev = route_index - 1 >= 0 ? @route[route_index - 1] : "нет"
			current = route[route_index];
			following = route_index + 1 < @route.stations.length ? @route[route_index + 1] : "нет"
			
			puts "предыдущая - #{prev}, текущая - #{current}, следующая - #{following}"
		else 
			puts "Нет маршрута"
		end
	end
	
	protected
	
	attr_writer :type #  указывается при создании
	attr_writer :speed # кастомные setter/getter
end
