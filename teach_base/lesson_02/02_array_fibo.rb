=begin
Заполнить массив числами фибоначи до 100
=end

array_fibo = [0,1,1]
next_num = array_fibo[-1] + array_fibo[-2]

while next_num <= 100
  array_fibo.push next_num
  next_num = array_fibo[-1] + array_fibo[-2]
end

puts array_fibo