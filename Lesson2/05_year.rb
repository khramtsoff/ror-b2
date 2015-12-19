#!/usr/bin/ruby

puts "Год:"
y = gets.to_i

puts "Месяц:"
m = gets.to_i

puts "День:"
d = gets.to_i

months = [31,28,31,30,31,30,31,31,30,31,30,31]
months[1] = 29 if ((y % 4 == 0 && y % 100 != 0) || y % 400 == 0)

days = d
(0...m-1).each { |i| days += months[i] }

puts days
