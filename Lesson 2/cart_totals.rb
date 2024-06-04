puts "Program: cart totals"

items = {}

loop do
  item = ""
  price = 0.0
  qty = 0.0

  loop do
    print "Enter the item's title: "
    item = gets.chomp.to_s.downcase
    break if item != ""
  end

  break if item == "stop"

  if items[item].nil?
    loop do
      print "Enter the price: "
      price = gets.chomp.to_f.round(2)
      break if price > 0.0
    end
  else
    price = items[item].keys[0]
  end

  loop do
    print "Enter the quantity: "
    qty = gets.chomp.to_f.round(3)
    break if qty > 0.0
  end

  if items[item].nil?
    items[item] = {price => qty}
  else
    items[item][price] += qty
  end

end

cart_totals = 0

items.each_value do |sums|
  cart_totals += sums.first[0]*sums.first[1]
end

items.each do |title, sums|
  puts "#{title}: #{sums}, total: #{sums.first[0]*sums.first[1]}"
end

puts "="*80
puts "cart totals: #{cart_totals}"