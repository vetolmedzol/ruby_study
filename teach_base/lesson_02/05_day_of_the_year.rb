# frozen_string_literal: true

# Three numbers are specified, which indicate the day, month, year
# (we ask the user). Find the ordinal date starting from the beginning
# of the year. Take into account that the year may be a leap year.
# A leap year, if it is divisible by four, but if it is divided by
# 100 without remainder, it is not a leap year. However, if it is divisible
# by 400, it is a leap year.(It is forbidden to use built-in ruby methods
# for this like Date # yday or Date # leap?)

puts 'Please input the date(day, month, year)!'
day = gets.chomp.to_i
month = gets.chomp.to_i
year = gets.chomp.to_i
months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

months[1] = 29 if ((year % 4).zero? && year % 100 != 0) || (year % 400).zero?

def incorrect_date?(day, month, months)
  months[month - 1] < day || month <= 0 || day <= 0 || month > 12
end

def date_number(day, month, months)
  if incorrect_date?(day, month, months)
    'Input incorrect!'
  else
    day + months[0..month - 2].sum
  end
end

puts date_number(day, month, months)
