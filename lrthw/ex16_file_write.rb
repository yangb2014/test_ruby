#!ruby

=begin
 * open -- Open a file
 * close -- Closes the file. Like File->Save.. in your editor.
 * read -- Reads the contents of the file. You can assign the result to a variable.
 * readline -- Reads just one line of a text file.
 * truncate -- Empties the file. Watch out if you care about the file.
 * write('stuff') -- Writes "stuff" to the file.
=end


filename = ARGV.first

puts "We're going to erase #{filename}"
puts "If you don't want that, hit ^C"
puts "If you do want that, hit RETURN"

$stdin.gets

puts "Opening the file ..."
target = open(filename, 'a+')   # r(read)/w(write)/a(append)/r+/w+/a+

# puts "Truncating the file, Goodbye!"
# target.truncate(0)

puts "Now I'm going to ask you for three lines."
print "line 1: "
line1 = $stdin.gets.chomp
print "line 2: "
line2 = $stdin.gets.chomp
print "line 3: "
line3 = $stdin.gets.chomp

puts "I'm going to write thest to the file"

target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")

puts "And finally, we close it."
target.close

