#!ruby

print "How old are you?"
age = gets                 # get a string from the user
print "How tall you are?"
height = gets.chomp        # get a string from the user, chomp off the '\n'
print "How much do you weight?"
weight = gets.chomp.to_i   # get a string from the user, chomp off the '\n', and convert it to integer

puts "So, you're #{age} old, #{height} tall, and #{weight} heavy."

