=begin
Квадратное уравнение. Пользователь вводит 3 коэффициента a, b и с.
Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть) 
и выводит значения дискриминанта и корней на экран. При этом возможны следующие варианты:
Если D > 0, то выводим дискриминант и 2 корня
Если D = 0, то выводим дискриминант и 1 корень (т.к. они в этом случае равны)
Если D < 0, то выводим дискриминант и сообщение "Корней нет"
=end

puts "Enter 3 coeff!"
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f

def result (a, b, c)
  dis = b**2 - 4 * a * c
  if dis < 0
    "Discriminant is #{dis}. No roots!"
  elsif dis == 0
    "Discriminant is #{dis}. And root is #{-b/(a * 2)}!"
  else
    "Discriminant is #{dis}. With roots #{(-b - Math.sqrt(dis))/(a * 2)} and #{(-b - Math.sqrt(dis))/(a * 2)}!"
  end
end

puts result(a, b, c)