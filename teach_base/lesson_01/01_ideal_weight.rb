# frozen_string_literal: true

# Perfect weight. The program prompts the user for the name
# and height and displays the ideal weight using the formula
# <height> - 110, after which it displays the result to the
# user on the screen with the name reference. If the ideal
# weight is negative, then the line 'Your weight is already
# optimal' is displayed.

puts 'Hi, what is your name?'
name = gets.chomp

puts "#{name}, what is your height, cm?"
height = gets.chomp.to_i

if (height - 110).negative?
  puts "#{name}, your weight is ideal now!"
else
  puts "#{name}, your ideal weight is #{height - 110}!"
end
