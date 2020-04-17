#!/usr/bin/ruby -w

# 集合遍历
properties = ['obejct oriented', 'duck type', 'productive', 'fun']
properties.each {|property| puts "Ruby is #{property}"}
properties.each do |property| 
    puts "Ruby is #{property}"
end

# Hash
hash = {canon: "camera", nikon: "camera", iphone: "phone"}
hash.each do |key, value|
    puts "#{key} is a #{value}"
end
