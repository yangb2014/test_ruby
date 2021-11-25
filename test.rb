#!/usr/bin/ruby -w

arr = []
10.times { |i| arr << i }
b = %w[a b c].product(arr).collect.each { |iter| iter.join('.') }
puts arr.inspect
puts b.inspect

# ~~ end ~~
