puts "Hello, file executing!"
puts File.basename(__FILE__)

lines = File.open(__FILE__, "r") do |file|
    file.readlines
end
lines.each {|line| puts line }

# This is an example file
# used for read/write it's own contents

exit