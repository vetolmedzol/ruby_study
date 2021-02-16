=begin
Дано целое шестизначное число. Необходимо определить, является ли оно счастливым.
=end

puts "Input six digit number, Bro!"
s_num = gets.chomp.to_i

def lucky_six(num)
  if num.digits.size == 6 && num.digits.take(3).sum == num.digits.reverse.take(3).sum
    "#{num} is a lucky number!"
  elsif num.digits.size == 6 && num.digits.take(3).sum != num.digits.reverse.take(3).sum
  	"#{num} is not a lucky number!"
  else
    "Six digit number, Bro! Six!" 
  end
end

puts lucky_six(s_num)
