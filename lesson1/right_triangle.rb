puts "Program: right triangle"

a, b, c = 0, 0, 0

loop do
  print "Enter the first side of the triangle: "
  a = gets.chomp.to_i
  break unless a == 0
end

loop do
  print "Enter the second side of the triangle: "
  b = gets.chomp.to_i
  break unless b == 0
end

loop do
  print "Enter the third side of the triangle: "
  c = gets.chomp.to_i
  break unless c == 0
end

if a >= b && a >= c
  hypotenuse, side_1, side_2 = a, b, c
elsif b >= c
  hypotenuse, side_1, side_2 = b, a, c
else
  hypotenuse, side_1, side_2 = c, a, b

end

is_right = hypotenuse**2 == side_1**2 + side_2**2
is_equilateral = a == b && b == c
is_isosceles = a == b || b == c || a == c

puts 'The triangle is: '
puts "right" if is_right
puts "equilateral" if is_equilateral
puts "isosceles" if is_isosceles
puts "not right, not equilateral and not isosceles" unless is_right || is_equilateral || is_isosceles
