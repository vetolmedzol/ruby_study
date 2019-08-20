# frozen_string_literal: true

require_relative 'train'
require_relative 'car'
require_relative 'route'
require_relative 'station'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_car'
require_relative 'passenger_car'
require_relative 'instance_counter'
require_relative 'company'

@train_arr = []
@car_arr = []
@station_arr = []
@loop_condition = 'To create train/station/car, enter create.To add or ' \
'remove cars, enter resize! To take a place in cars enter cars work! To view' \
 ' the list of stations and trains, enter view all, to add train on station' \
 'enter add train, to see train or station info enter train info or station' \
 ' info! To take place in car, enter take place! To stopped enter stop!'

cargo_train = CargoTrain.new('12345')
cargo_car = CargoCar.new
station = Station.new('Kharkov')
@train_arr << cargo_train
@car_arr << cargo_car
@station_arr << station

def car_choice(car_obj)
  if car_obj.class == CargoCar
    puts 'Input how much volume you need!'
    volume = gets.chomp.to_i
    car_obj.take_place(volume)
  elsif car_obj.class == PassengerCar
    car_obj.take_place
  end
  puts car_obj.free_capacity
end

def find_train_obj
  puts "Enter train id and id your car! #{@train_arr}"
  id = gets.chomp
  @train_arr.find { |train| train.id == id }
end

def book_place
  train_obj = find_train_obj
  puts train_obj.number_of_cars
  car_id = gets.chomp
  car_obj = train_obj.number_of_cars.find { |car| car.car_id.to_s == car_id }
  car_choice(car_obj)
end

def station_info
  puts "Input name of your station! #{@station_arr}"
  name = gets.chomp
  station = @station_arr.find do |item|
    item.name == name
  end
  station.each_train do |train|
    puts "Your train id is  #{train.id}, type is #{train.train_type}, " \
  "number of cars #{train.number_of_cars}"
  end
end

def train_info
  train_obj = find_train_obj
  train_obj.number_of_cars.each do |car|
    puts "Your car id #{car.car_id},type #{car.class},capacity #{car.capacity}"
  end
end

def new_cargo_train
  puts 'Please, input id new cargo train!'
  id = gets.chomp.to_s
  @train_arr << CargoTrain.new(id)
  puts "You created a #{@train_arr.find { |train| train.id == id }}"
rescue StandardError => e
  puts e.inspect
end

def new_passenger_train
  puts 'Please, input id new passenger train!'
  id = gets.chomp.to_s
  @train_arr << PassengerTrain.new(id)
  puts "You created a #{@train_arr.find { |train| train.id == id }}"
rescue StandardError => e
  puts e.inspect
end

def new_cargo_car
  @car = CargoCar.new
  puts "You created a #{@car.class} "
  @car_arr << @car
rescue StandardError => e
  puts e.inspect
end

def new_passenger_car
  @car = PassengerCar.new
  puts "You created a #{@car.class}"
rescue StandardError => e
  puts e.inspect
end

def new_station
  puts 'Please, input name of new station!'
  name = gets.chomp
  @station_arr << Station.new(name)
  puts "You create a station #{name}"
rescue StandardError => e
  puts e.inspect
end

def add_car
  puts "Enter train id! #{@train_arr}"
  id = gets.chomp
  puts "Enter id of your car! #{@car_arr.each(&:object_id)}"
  car_id = gets.chomp.to_s
  car_obj = @car_arr.find { |car| car.car_id.to_s == car_id }
  @train_arr.find { |train| train.id == id }.add_car(car_obj)
end

def remove_car
  train_obj = find_train_obj
  puts "Enter id of your car! #{@car_arr.each(&:object_id)}"
  car_id = gets.chomp.to_s
  car_obj = train_obj.number_of_cars.find { |car| car.car_id.to_s == car_id }
  train_obj.remove_car(car_obj)
end

def add_train
  puts 'Choose station from list, and enter train id from list!'
  puts @station_arr
  puts @train_arr
  name = gets.chomp
  id = gets.chomp
  station_obj = @station_arr.find { |station| station.name == name }
  train_obj = @train_arr.find { |train| train.id == id }
  station_obj.add_train(train_obj)
end

def creator(input_object)
  case input_object
  when 'cargo train' then new_cargo_train
  when 'passenger train' then new_passenger_train
  when 'station' then new_station
  when 'cargo car' then new_cargo_car
  when 'passenger car' then new_passenger_car
  else 'Incorrect input!'
  end
end

def add_or_del(choice)
  case choice
  when 'add' then add_car
  when 'remove' then remove_car
  else
    'Make a choice, add or remove!'
  end
end

loop do
  puts @loop_condition
  input = gets.chomp
  break if input.downcase == 'stop'

  case input
  when 'create'
    loop do
      puts 'Enter object do you want to create!To come back to menu enter back!'
      input_object = gets.chomp
      break if input_object.downcase == 'back'

      creator(input_object)
    end
  when 'view all' then puts @station_arr, @train_arr
  when 'add train' then add_train
  when 'train info' then train_info
  when 'station info' then station_info
  when 'take place' then book_place
  when 'resize'
    puts 'You want to add or remove car?'
    choice = gets.chomp
    add_or_del(choice)
  else
    'Incorrect input!'
  end
end
