=begin
Даны два числа. Необходимо найти их среднее геометрическое.
=end

puts "Enter 2 numbers!"
a = gets.chomp.to_f
b = gets.chomp.to_f

def geometric(a,b)
  Math.sqrt(a * b)
end

puts geometric(a,b)