puts "Program: ascending numbers"

arr = []

(10..100).each { |i|
  arr << i if i % 5 == 0
}

print arr