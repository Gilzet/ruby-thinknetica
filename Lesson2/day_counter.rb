require 'date'

puts "Program: day counter"

day, month, year  = 0, 0, 0
counter = 0
months = {
  1 => 31,
  2 => 29,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31
}

loop do
  print "Enter a day: "
  day = gets.chomp.to_i
  break if day != 0
end

loop do
  print "Enter a month: "
  month = gets.chomp.to_i
  break if month != 0
end

loop do
  print "Enter a year: "
  year = gets.chomp.to_i
  break if year != 0
end

year = Date.today.year if (1..9999).none?(year)
month = Date.today.month if (1..12).none?(month)
day = Date.today.day if (1..months[month]).none?(day)

is_leap_year = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)

# leap day correction
day -= 1 if month == 2 && day == 29 && !is_leap_year

(month-1).times do |index|
  counter += months[index+1]
end

counter += day
counter -= 1 if !is_leap_year && month > 2

puts "Date is #{day}.#{month}.#{year}"
puts "Days since new year: #{counter}"
