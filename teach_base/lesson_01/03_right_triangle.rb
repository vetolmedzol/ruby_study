=begin
Прямоугольный треугольник. Программа запрашивает у пользователя 3 стороны треугольника 
и определяет, является ли треугольник прямоугольным, используя теорему Пифагора 
и выводит результат на экран. Также, если треугольник является при этом равнобедренным 
(т.е. у него равны любые 2 стороны), то дополнительно выводится информация о том, 
что треугольник еще и равнобедренный.
=end


puts "Input three sides of your right triangle!"
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f

def type_triangle (a,b,c)
  if (b < a &&  a > c) && (a**2 == c**2 + b**2)
  	"Your triangle is right!"
  elsif (a < b &&  b > c) && (b**2 == a**2 + c**2)
  	"Your triangle is right!"
  elsif (a < c &&  c > b) && (c**2 == a**2 + b**2)
  	"Your triangle is right!"
  elsif (a == b && b == c)
  	"Your triangle is equilateral!"
  elsif (a == b || b == c)
  	"Your triangle is isosceles!"
  else 
  	"Your triangle is not right!"
  	  end
end

puts type_triangle(a,b,c)