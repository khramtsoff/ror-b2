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
7. Вызывать Train.all 
8. Для каждой станции список поездов в формате: Номер поезда, тип, кол-во вагонов
"

@trains_counter = 0
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
	train = Train.new(@trains_counter, type, length) if type.length != 0
	if train
		@trains_counter += 1		
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
	Train.trains.size > 0 ? (puts Train.trains) : (puts "Нет поездов")
	@stations.size > 0 ? (puts @stations) : (puts "Нет станций")
end

def get_train
	trains = Train.trains
	if trains.size == 1
		trains[0]
	elsif trains.size > 0
		puts "Номер поезда:"
		n = gets.to_s2
		trains[n.to_sym]
	end
end

def enumerate_stations
	p = Proc.new { |t| puts "#{t.train_number}-#{t.type}-#{t.length}"} 
	@stations.each { |s| call_trains(p)}
end

while true
	puts menu
	print "(1-8):"
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
	when 7
		Train.all
	when 8
		enumerate_stations
	end
end