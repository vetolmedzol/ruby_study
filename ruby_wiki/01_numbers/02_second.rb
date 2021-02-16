=begin
Идет k-я секунда года. Необходимо определить сколько полных 
месяцев и полных недель осталось до конца года.
=end

k = Time.now.to_i

def seconds (k)
  start_year = Time.new(Time.now.year).to_i
  end_year = Time.new(Time.now.year + 1).to_i - 1
  dif = end_year - k
  months = dif/60/60/24/30
  weeks = ((dif.to_f/60/60/24) - (dif/60/60/24))*7
    return hash = {month: months, weeks: weeks.to_i }
end

puts seconds(k)