#!ruby

# comment : test array
a = [1, 2, 'this ', 'is ', 3.45]
print "a : "
print a
print "\n"

print "a[0] : "
print a[0]
print "\n"
print "a[1] : "
print a[1]
print "\n"
print "a[2] : "
print a[2]
print "\n"
print "a[3] : "
print a[3]
print "\n"
print "a[4] : "
print a[4]
print "\n"

print "a[1..3] : "
print a[1..3]
print "\n"

a[4] = 'an '
print "a : "
print a
print "\n"

a[5] = ["another ", "array "]
print "a : "
print a
print "\n"


# comment : test hash
h = {'a' => 'this', 'b' => 'is', 'c' => 'hash'}
print "h : "
print h
print "\n"

print "h['a'] : "
print h['a']
print "\n"
print "h['b'] : "
print h['b']
print "\n"
print "h['c'] : "
print h['c']
print "\n"

h['some'] = 'value'
print "h : "
print h
print "\n"

#h = {canon:'camera', nikon:'camera', iphone:'phone'}
h = {:canon=>"camera", :nikon=>"camera", :iphone=>"phone"}
print "h : "
print h
print "\n"

h.each do |key, value|
  puts "#{key} is a #{value}"
end

# comment : test stack
stack = []
stack.push 1
stack.push 2
stack.push 'hello'
print "stack : "
print stack
print "\n"

stack.pop
print "stack : "
print stack
print "\n"


# comment : test traversal
a = ['This', 'is', 'an', 'array']
print "traversal : \n"
a.each do |item|
  puts item
end


# comment : test enumerable
(1..4).map do |i|
   puts i*i
end

a = ["cat", "horse", "monkey"]
print "min_by : "
print a.min_by {|i| i.length}
print "\n"
print "max_by : "
print a.max_by {|i| i.length}
print "\n"


