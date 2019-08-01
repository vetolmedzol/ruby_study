# frozen_string_literal: true

# Right triangle. The program prompts the user for 3 sides
# of the triangle and determines whether the triangle is
# rectangular using the Pythagorean theorem and displays
# the result on the screen. Also, if the triangle is isosceles
# (i.e., it has any 2 sides equal), then information is also
# displayed that the triangle is also isosceles.

puts 'Hi! Input three sides of your triangle!'
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f

sides = [a, b, c].sort

def triangle?(sides)
  sides[0] + sides[1] > sides[2] && sides[0].positive?
end

return puts 'It is not triangle!' unless triangle?(sides)

def style_triangle(sides)
  result = []
  result << 'equilateral' if sides.uniq.size == 1
  result << 'isosceles' if sides.uniq.size < 3
  result << 'scalene' if sides.uniq.size > 2
  result << 'right' if triangle_right?(sides)
  result.join(' and ')
end

def triangle_right?(sides)
  sides[2]**2 == sides[0]**2 + sides[1]**2
end

puts "Your triangle is #{style_triangle(sides)}!"
