#!/usr/bin/ruby -w

puts "hello, world"

# 变量不用事先声明
language = 'Ruby'
puts "hello, #{language}"

# 单引号包含的字符串直接使用，双引号包含的字符串会引发字符串替换(替换失败会报错)
language = 'my Ruby'
puts "hello, #{language}"
