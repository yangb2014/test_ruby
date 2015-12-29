
puts "hello"

#exec 'echo "hello $HOSTNAME 2"'

system 'echo "hello $HOSTNAME 3"'

#today = `date`
#$?
#$?.to_i

IO.popen("date") { |f| puts f.gets }



