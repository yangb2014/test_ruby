#!/usr/bin/ruby -w
# mixin: enumerable, comparable

puts 'begin' <=> 'end'
puts 'same' <=> 'same'

a = [5, 3, 4, 1]
puts a.sort.join(", ")
puts a.any? {|i| i > 6}
puts a.any? {|i| i > 4}
puts a.all? {|i| i > 4}
puts a.all? {|i| i > 0}
puts a.collect {|i| i * 2}
puts a.select {|i| i % 2 == 0}
puts a.select {|i| i % 2 == 1}
puts a.max
puts a.member?(2)

puts a.inject(0) {|sum, i| sum + i}
puts a.inject {|sum, i| sum + i}
a.inject(0) do |sum, i|
    puts "sum: #{sum}, i:#{i}, sum + i: #{sum + i}"
    sum + i
end

