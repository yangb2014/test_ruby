#!/usr/bin/ruby -w

# 数组
animals = ['lions', 'tigers', 'bears']
puts "animals: #{animals}"

# 数组下标
puts "animals[0] #{animals[0]}"
puts "animals[2] #{animals[2]}"
puts "animals[10] #{animals[10]}"
puts "animals[-1] #{animals[-1]}"
puts "animals[-2] #{animals[-2]}"
puts "animals[-10] #{animals[-10]}"
puts "animals[0..1] #{animals[0..1]}"

# 赋值
a = []
a[0] = 'zero'
a[1] = 1
a[2] = ['two', 'things']
puts "a: #{a}"

# 多维数组
a = [[1, 2, 3], [10, 20, 30], [40, 50, 60]]
puts "a[0][0] #{a[0][0]}"
puts "a[1][2] #{a[1][2]}"
puts "a[1] #{a[1]}"

# push/pop
a = [1]
a.push(2)
puts "after a.push(2), a: #{a}"
puts "a.pop #{a.pop}"
puts "a.pop #{a.pop}"
