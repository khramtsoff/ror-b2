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
	
	puts "#{product[:price]*product[:amount]}"
	purchases[title] = product	
end

s = 0

purchases.each { |t, p| 
	puts "#{t} - #{p[:price]} * #{p[:amount]} = #{p[:price]*p[:amount]}"
	s += p[:price] * p[:amount] 
}

puts s
