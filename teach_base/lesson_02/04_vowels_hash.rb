=begin
Заполнить хеш гласными буквами, где значением будет являтся порядковый 
номер буквы в алфавите (a - 1).
=end

vowels_arr = ["a", "e", "i", "o", "u", "y"]

("a".."z").each_with_index {|val, index|
  if vowels_arr.include? val 
    vowels_hash = {index += 1 => val}
    puts vowels_hash
  end
}
