#!ruby

# comment : test class

class Dog
  @@count = 0
  attr :breed, :color, :name
  def initialize (name, color, breed)
    @name, @color, @breed = name, color, breed
    @@count += 1
  end

  def bark (volume = :softly)
    make_a_ruckus(volume)
  end

  def self.total_count
    @@count
  end
end

class Spaniel < Dog
  def self.test_xx
    print "test"
  end
end

my_dog = Dog.new('Rover', :brown, 'Cocker Spaniel')

# test
print Spaniel.superclass
print "\n"
print Dog.superclass
print "\n"
print Object.superclass
print "\n"
print BasicObject.superclass
print "\n"


