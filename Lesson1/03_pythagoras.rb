#!/usr/bin/ruby

puts "a:"
a = gets.chomp.to_f

puts "b:"
b = gets.chomp.to_f

puts "c:"
c = gets.chomp.to_f

t = [a, b, c].sort!

if t[2]**2 == t[0]**2 + t[1]**2
	puts "Прямоугольный"
	if t[0] == t[1]
		puts "еще и равнобедренный"
	end
else
	puts "непрямоугольный"
end