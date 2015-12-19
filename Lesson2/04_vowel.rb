#!/usr/bin/ruby

hash = {}
"aeiou".chars.to_a.each { |l| hash[l.to_sym] = l.ord }

puts hash