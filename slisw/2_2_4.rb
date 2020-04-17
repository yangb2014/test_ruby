#!/usr/bin/ruby -w

x = 4

# true/false 也是一等对象
puts x < 5
puts x > 5
puts false.class
puts true.class

# if/unless 条件判断：单行形式
puts 'This appears to be false.' unless x == 4
puts 'This appears to be true.' if x == 4

# if/unless 条件判断：块形式
if x == 4 then
    puts 'This appears to be true 2.'
end

unless x == 4 then
    puts 'This appears to be false 3.'
else
    puts 'This appears to be true 3.'
end

# flase/nil is false, other is true
puts "random string is true" if 'random string'
puts "0 is true" if 0
puts "true is true" if true
puts "false is true" if false
puts "nil is true" if nil

# while
x = x + 1 while x < 10
puts "{x = x + 1 while x < 10}, get #{x}"

x = 4
while x < 10
    x = x + 1
    puts x
end

# until
x = x - 1 until x == 1
puts "{x = x - 1 until x == 1}, get #{x}"
