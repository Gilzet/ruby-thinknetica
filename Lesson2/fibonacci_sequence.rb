puts "Program: fibonacci sequence"

arr = []
i = 0
j = 1

while i <= 100 && j <= 100
  arr.push i
  arr.push j
  i += j
  j += i
end

print arr
