#!ruby

# comment : test strings 

print "There are #{24 * 60 * 60} seconds a day.\n"

print 'This is also a string.'
print "\n"

print %q/This is a string/
print "\n"

print %q{This is another string}
print "\n"

print %Q!#{'Ho! ' * 3} Merry Christmas\!!
print "\n"

string = <<END_OF_STRING
    The quick brown fox jumps
    over the lazy dog.
END_OF_STRING
print string

a = "hello "
b = "world!"
print (a + b)
print "\n"

print (a << b)
print "\n"
print a

print (a * 3)
print "\n"

c = "This is a string"
print c
print "\n"

d = c.split
print d


