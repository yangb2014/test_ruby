#!ruby

# comment : test func
def op(a, b)
  a << b
end

x = 'hello'
y = 'world'
print op(x, y)
print "\n"

x = 1 
y = 2
print op(x, y)
print "\n"

x = ['hello']
y = 'world'
print op(x, y)
print "\n"


# comment : test type
def op_str(a, b)
#  throw "Input parameters to op must be string"
    unless a.is_a?String and b.is_a?String
  a << b
  end
end

x = 'hello'
y = 'world'
print op_str(x, y)
print "\n"

x = 1
y = 2
print op_str(x, y)
print "\n"



