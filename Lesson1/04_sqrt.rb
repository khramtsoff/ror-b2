#!/usr/bin/ruby
puts "a:"
a = gets.chomp.to_f

puts "b:"
b = gets.chomp.to_f

puts "c:"
c = gets.chomp.to_f

d = Math.sqrt(b).to_f - 4.0 * a * c


if d > 0
	s = Math.sqrt(d).to_f
	
	x1 = (- b + s)/(2.0 * a)
	x2 = (- b - s)/(2.0 * a)
	
	puts "x1 = #{x1}"
	puts "x2 = #{x2}"
elsif d == 0
	puts "x = #{-b/(2.0 * a)}"
else
	puts "Уравнение не имеет решений"
end
