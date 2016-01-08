#!/usr/bin/ruby

class Train

	CARGO = "cargo"
	PASSENGER = "passenger"  

	attr_accessor :type # грузовой, пассажирский
	
	attr_accessor :speed # -набирать скорость, показывать текущую скорость
	attr_reader :length # -показывать количество вагонов

	attr_accessor :route # -Принимать маршрут следования
	attr_reader :route_index  
	
	# Имеет, тип, который указывается при создании: грузовой, пассажирский и количество вагонов
	def initialize(type, length)
		@type = type
		@length = length
	end

	# томозить
	def stop
		self.speed = 0
	end

	# прицеплять/отцеплять вагоны (по одному вагону за операцию, 
	# метод просто увеличивает или уменьшает количество вагонов). 
	# Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
	def add_wagon
		self.length += 1 if self.speed == 0
	end

	def remove_wagon
		self.length -= 1 if self.speed == 0 and self.length > 0
	end

	# Перемещаться между станциями, указанными в маршруте.
	def next_station
		self.route_index += 1 if self.route.stations.length < self.length - 1
	end

	# Принимать маршрут следования
	def route=(route)
		@route = route
		self.route_index = 0
	end
	
	def route_index=(route_index)
		@route_index = route_index
		self.route[route_index].current_train = self
	end

	# Показывать предыдущую станцию, текущую, следующую, на основе маршрута
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

end
