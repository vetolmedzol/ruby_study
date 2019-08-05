# frozen_string_literal: true

# Fill the hash with vowels, where the value will be ordinal
# letter number in the alphabet (a - 1).

vowels_arr = %w[a e i o u y]
vowels_hash = {}

('a'..'z').each_with_index do |key, value|
  vowels_hash[value + 1] = key if vowels_arr.include?(key)
end
print vowels_hash
