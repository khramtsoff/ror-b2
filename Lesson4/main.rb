#!/usr/bin/ruby

require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_train'
require_relative 'passenger_wagon'
require_relative 'railwaystation'
require_relative 'route'
require_relative 'train'
require_relative 'wagon'

menu = 
"
1. Создавать станции
2. Создавать поезда
3. Добавлять вагоны к поезду
4. Отцеплять вагоны от поезда
5. Помещать поезда на станцию
6. Просматривать список станций и список поездов на станции
"

@trains = []
@stations = []

def create_station
	puts "Название:"
	name = gets.to_s
	station = RailwayStation.new(name) if name.length != 0
	if station
		@stations << station
		puts station
	end
end

def create_train
	puts "Тип(#{Train::PASSENGER},#{Train::CARGO}):"
	type = gets.to_s
	puts "Длина:"
	length = gets.to_i
	train = Train.new(type, length) if type.length != 0
	if train
		@trains << train 
		puts train
	end
end

def add_wagon
	train = get_train
	if train
		train.add_wagon
		puts train
	end
end

def remove_wagon
	train = get_train
	if train
		train.remove_wagon if train
		puts train
	end
end

def move_train_to_next_station
	train = get_train
	if train != nil
		train.next_station
		puts train
	end
end

def show_stations_and_trains
	@trains != nil ? (puts @trains) : (puts "Нет поездов")
	@stations != nil ? (puts @stations) : (puts "Нет станций")
end

def get_train
	size = @trains.size
	if size == 1
		@trains.first
	elsif @trains.size > 0
		puts "Номер поезда:"
		n = gets.to_i
		@trains[n]
	end
end

while true
	puts menu
	print "(1-6):"
  n = gets.to_i

	case n
	when 1
		create_station
	when 2
		create_train
	when 3
		add_wagon
	when 4
		remove_wagon
	when 5
		move_train_to_next_station
	when 6
		show_stations_and_trains
	end
end

