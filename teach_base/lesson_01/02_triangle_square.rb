=begin
Площадь треугольника. Площадь треугольника можно вычилсить,
 зная его основание (a) и высоту (h) по формуле: 1/2*a*h. 
 Программа должна запрашивать основание и высоту треуголиника и возвращать его площадь.
=end

puts "Please input height of your triangle!"
height = gets.chomp.to_f

puts "Please input base of your triangle!"
base = gets.chomp.to_f

def tri_square (h, b)
  0.5 *  h * b 
end

puts tri_square(height, base)