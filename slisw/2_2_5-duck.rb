#!/usr/bin/ruby -w

# duck typing

# 类型安全: type safe
puts "4.class get ", 4.class
puts "4.0.class get ", 4.0.class
puts "4 + 4.0 get", (4 + 4.0)

#
i = 0
a = ['100', 100.0]
while i < 2
    puts a[i].to_i
    i += 1
end
