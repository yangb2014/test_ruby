#!/usr/bin/ruby -w

# hash
numbers = {1 => 'one', 2 => 'two'}
puts "numbers[1] get #{numbers[1]}"
puts "numbers[2] get #{numbers[2]}"

# symble
stuff = {:array => [1, 2, 3], :string => "Hi, mom!"}
puts "stuff[:string] get #{stuff[:string]}"

# 
puts "get string object_id ", 'str'.object_id
puts "get string object_id ", 'str'.object_id
