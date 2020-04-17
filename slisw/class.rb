#!/usr/bin/ruby -w

class Dog
    attr :breed, :color, :name

    def self.total_count
        @@count
    end

    def initialize(name, color, breed)
        @@count += 1
        @name, @color, @breed = name, color, breed
    end

end

dog1 = Dog.new("jack", "gray", "wolf")
puts "get #{Dog.total_count} dogs", dog1.name

dog2 = Dog.new("monkey", "orange", "husky")
puts "get #{Dog.total_count} dogs", dog1.name, dog2.name
