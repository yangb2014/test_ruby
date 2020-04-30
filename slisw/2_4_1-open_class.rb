#!/usr/bin/ruby -w
# In Ruby, classes are never closed.

# add NilClass a method blank?
class NilClass
    def blank?
        true
    end
end

class String
    def blank?
        self.size == 0
    end
end

["", "person", nil].each do |element|
    puts element unless element.blank?
end

# An English Units
class Numeric
    def inches
        self
    end

    def feet
        self * 12.inches
    end

    def yards
        self * 3.feet
    end

    def miles
        self * 5280.feet
    end

    def back
        self * -1
    end

    def forward
        self
    end
end

puts 10.miles.back
puts 2.feet.forward

