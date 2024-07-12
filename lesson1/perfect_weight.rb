puts "Program: perfect weight"

name = ""
height = 0

loop do
  print "Enter your name: "
  name = gets.chomp.capitalize
  break unless name == ""
end

loop do
  print "Enter your height: "
  height = gets.chomp.to_i
  break unless height == 0
end

weight = (height - 110) * 1.15

if weight > 0
  puts "#{name}, your \"perfect\" weight is: #{weight} kg"
else
  puts "#{name}, your weight is already optimal!"
end
