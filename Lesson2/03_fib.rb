#!/usr/bin/ruby

array = (0..100).to_a
(2..100).each { |x| array[x] = array[x - 2] + array[x - 1]}