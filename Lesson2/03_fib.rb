#!/usr/bin/ruby

array = [0, 1]
(2..100).each { |x| array[x] = array[x - 2] + array[x - 1]}