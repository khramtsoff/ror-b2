#!/usr/bin/ruby

puts "Как тебя зовут?"
name = gets.chomp

puts "Какой у тебя рост?"
height = gets.chomp.to_f

weight = height - 110

if weight < 0
	puts "Ваш вес уже оптимальный"
else
	puts "#{name}, ваш оптимальный вес - #{weight}кг"
end
	
