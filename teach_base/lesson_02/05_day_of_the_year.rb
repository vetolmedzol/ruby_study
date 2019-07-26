=begin
Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). 
Найти порядковый номер даты, начиная отсчет с начала года. 
Учесть, что год может быть високосным. Год високосный, если он делится на четыре без остатка, 
но если он делится на 100 без остатка, это не високосный год. 
Однако, если он делится без остатка на 400, это високосный год.
(Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)
=end

puts "Please input the date(day, month, year)!"
day = gets.chomp.to_i
month = gets.chomp.to_i
year = gets.chomp.to_i

#this method is not need a check about leap year or not, it is allwaus true
def day_of_y(y,m,d) 
  input_day = Time.new(y, m, d)
  start_year = Time.new(y)
  return diff = ((input_day - start_year) /60/60/24).to_i + 1
end

def  leap_year (y)
  if (y % 4 == 0 && y % 100 != 0) || (y % 400 == 0)
    true
  else 
  	false
  end
end

puts "Is the #{year} a leap year? That is absolutly #{leap_year(year)}!"

puts "The number of your day in #{year} year is #{day_of_y(year,month,day)}!"