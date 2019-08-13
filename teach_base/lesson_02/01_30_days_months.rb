# frozen_string_literal: true

# Make hash containing months and number of days in a month.
# In the cycle, output those months in which the number of days is exactly 30.

months = {
  january: 31,
  february: 28,
  march: 31,
  april: 30,
  may: 31,
  june: 30,
  july: 31,
  august: 31,
  september: 30,
  october: 31,
  november: 30,
  december: 31
}

months.each { |key, value| puts key if value == 30 }
