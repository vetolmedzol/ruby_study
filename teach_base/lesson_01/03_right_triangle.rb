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
side1 = sides[2]
side2 = sides[0]
side3 = sides[1]

def it_is_triangle?(side1, side2, side3)
  side2 + side3 > side1 && side2.positive?
end

return puts 'It is not triangle!' unless it_is_triangle?(side1, side2, side3)

def style_triangle(side1, side2, side3, sides)
  result = []
  result << 'equilateral' if sides.uniq.size == 1
  result << 'isosceles' if sides.uniq.size == 2
  result << 'scalene' if sides.uniq.size > 2
  result << 'right' if triangle_right?(side1, side2, side3)
  "Your triangle is #{result.join(' and ')}!"
end

def triangle_right?(side1, side2, side3)
  side1**2 == side2**2 + side3**2
end

puts style_triangle(side1, side2, side3, sides)
