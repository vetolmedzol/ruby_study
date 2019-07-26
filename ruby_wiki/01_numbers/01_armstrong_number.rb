#1
=begin Дано четырехзначное целое число.
  Необходимо проверить, является ли оно числом Армстронга.
  1**3 + 5**3 + 3**3 = 153.
=end


puts "Enter your number!"
number = gets.chomp.to_i

def armstrong_numbers(num)
  num.digits.sum{|x| x**num.digits.size} == num
end

armstrong_numbers (number)