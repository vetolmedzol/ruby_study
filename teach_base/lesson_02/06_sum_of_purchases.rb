=begin
Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и 
кол-во купленного товара (может быть нецелым числом). 
Пользователь может ввести произвольное кол-во товаров до тех пор, 
пока не введет "стоп" в качестве названия товара. 
На основе введенных данных требуетеся:
1. Заполнить и вывести на экран хеш, ключами которого являются названия товаров, 
а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара. 
Также вывести итоговую сумму за каждый товар.
2. Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
=end
basket = {} 

loop do
  puts "Enter product, what you want to add in basket! Enter 'stop' if you want to stoped!"
  prod = gets.chomp
  break if prod.downcase == "stop"
  puts "Enter price of #{prod}!"
  price = gets.chomp.to_f
  puts "Enter how match product you want to buy!"
  count = gets.chomp.to_f
  basket[prod] = {
  	price: price,
    count: count,
    coast: price * count}
end

basket_coast = 0
basket.each { |key, value| basket_coast += value[:coast] }
puts "All product coast : #{basket_coast}"
