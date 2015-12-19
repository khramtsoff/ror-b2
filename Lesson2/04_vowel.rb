#!/usr/bin/ruby

vowels = "aeiou".chars.to_a
hash = {}
('a'..'z').to_a.each_with_index { |l, i| hash[l.to_sym] = i + 1 if vowels.include? l }

puts hash