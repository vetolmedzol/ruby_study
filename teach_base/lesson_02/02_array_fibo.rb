# frozen_string_literal: true

# Fill the array with fibonacci numbers up to 100

array_fibo = [0, 1]
next_num = 1

while next_num <= 100
  array_fibo << next_num
  next_num = array_fibo[-1] + array_fibo[-2]
end

puts array_fibo
