#!/usr/bin/ruby

purchases = {}

loop do
	puts "Название:"
	title = gets.chomp
	break if title == "стоп"

	puts "Цена:"
	price = gets.to_f

	puts "Количество:"
	amount = gets.to_f

	product = { price: price, amount: amount }	
	purchases[title] = product	
end

puts purchases

s = 0
purchases.each { |t, p| s += p[:price] * p[:amount] }

puts s
