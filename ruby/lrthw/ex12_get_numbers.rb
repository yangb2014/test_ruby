#!ruby

print "Give me a integer: "
number = gets.chomp.to_i    # try input a float, eg. 2.5

bigger = number * 100
puts "A bigger number is #{bigger}."

print "Give me another number: "
another = gets.chomp
number = another.to_i

small = number / 100
puts "A small number is #{small}."

print "Give me a float: "
number = gets.chomp.to_f
number = number / 100
puts "A float number is #{number}"


