=begin
	Идеальный вес. Программа запрашивает у пользователя имя и рост и выводит 
	идеальный вес по формуле <рост> - 110, после чего выводит результат пользователю 
	на экран с обращением по имени. Если идеальный вес получается отрицательным,
	 то выводится строка "Ваш вес уже оптимальный"
=end

puts "Hi, what is your name?"
name = gets.chomp

puts "#{name}, what is your height, cm?"
height = gets.chomp.to_i

if height - 110 < 0
  puts "#{name}, your weight is ideal now!"
else 
  puts "#{name}, your ideal weight is #{height - 110}!"
end
