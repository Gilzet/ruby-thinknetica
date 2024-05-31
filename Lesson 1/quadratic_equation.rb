puts "Program: quadratic equation"

a, b, c = 0, 0, 0

puts "The form of a quadratic equation is:"
puts "a * x^2 + b * x + c = 0"

loop do
  print "Enter a: "
  a = gets.chomp.to_i

  if a == 0
    puts "if a = 0 then the equation is not quadratic"
  else
    break
  end

end

print "Enter b: "
b = gets.chomp.to_i

print "Enter c: "
c = gets.chomp.to_i

puts "The quadratic equation is:"
puts "#{a.to_s+"*" if a != 1}x^2#{sprintf("%+d", b)+"*x" if b !=0}#{sprintf("%+d", c) if c !=0}=0"

discriminant = b ** 2 - 4 * a * c

if discriminant > 0
  x1 = (-b + Math.sqrt(discriminant)) / (2 * a)
  x2 = (-b - Math.sqrt(discriminant)) / (2 * a)

  puts "discriminant = #{discriminant}, x1 = #{x1} and x2 = #{x2}"
elsif discriminant == 0
  x = -b  / (2 * a)
  puts "discriminant = #{discriminant}, x = #{x}"
else
  puts "discriminant = #{discriminant}, there are no real roots"
end
