# frozen_string_literal: true

# Amount of purchases. The user enters in turn the name of the product,
# the price per unit and the quantity of the product purchased
# (may be a non-integer number). The user can enter an arbitrary
# number of goods until he enters the "stop" as the name of the product.
# Based on the data entered, you need:
# 1. Fill in and display a hash, the keys of which are the names
# of the goods, and the value is an embedded hash containing the price
# per unit of goods and the quantity of goods purchased.
# Also display the total amount for each item.
# 2. Calculate and display the total amount of all purchases in the "basket".

basket = {}

loop do
  puts "Enter product, to add it in basket! Enter 'stop' if you want to stoped!"
  prod = gets.chomp
  break if prod.downcase == 'stop'

  puts "Enter price of #{prod}!"
  price = gets.chomp.to_f
  puts 'Enter how match product you want to buy!'
  count = gets.chomp.to_f
  basket[prod] = {
    price: price,
    count: count,
    coast: price * count
  }
end

basket_coast = 0
basket.each { |_key, value| basket_coast += value[:coast] }
puts "Your basket include: #{basket}!"
puts "All product coast : #{basket_coast}"
