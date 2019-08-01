# frozen_string_literal: true

# Area of a triangle. The area of a triangle can be
# calculated by knowing its base (a) and height (h)
# according to the formula: 1/2 * a * h. The program
# must request the base and height of the triangle and return its area.

puts 'Please input height of your triangle!'
height = gets.chomp.to_f

puts 'Please input base of your triangle!'
base = gets.chomp.to_f

def triangle_square(height, base)
  0.5 * height * base
end

puts triangle_square(height, base)
