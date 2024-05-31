puts "Program: area of triangle"

b = 0
h = 0

loop do
  print "Enter the base: "
  b = gets.chomp.to_i
  break unless b == 0
end

loop do
  print "Enter the height: "
  h = gets.chomp.to_i
  break unless h == 0
end

area = b * h / 2

puts "The area of a triangle is #{area}"
