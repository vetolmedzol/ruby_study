# frozen_string_literal: true

# Quadratic equation. The user enters 3 coefficients a, b and c.
# The program calculates the discriminant (D) and the roots
# of the equation (x1 and x2, if any) and displays the discriminant
# values and roots on the screen. The following options are possible:
# If D> 0, then we deduce the discriminant and 2 roots
# If D = 0, then we derive the discriminant and 1 root (since in this
# case they are equal)
# If D <0, then we display the discriminant and the message "No roots"

puts 'Enter 3 coeff!'
coef1 = gets.chomp.to_f
coef2 = gets.chomp.to_f
coef3 = gets.chomp.to_f
discriminant = coef2**2 - 4 * coef1 * coef3
puts "Discriminant is #{discriminant}."

def result(coef1, coef2, coef3, discriminant)
  if discriminant.positive?
    discriminant_positive(coef1, coef2, coef3, discriminant)
  elsif discriminant.zero?
    "x1 = x2 = #{- coef2 / (coef1 * 2)}"
  else
    'No roots!'
  end
end

def discriminant_positive(coef1, coef2, _coef3, discriminant)
  "x1 = #{(- coef2 + Math.sqrt(discriminant)) / (2 * coef1)} \
  x2 = #{(- coef2 - Math.sqrt(discriminant)) / (coef1 * 2)}"
end

puts result(coef1, coef2, coef3, discriminant)
