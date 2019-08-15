# frozen_string_literal: true

# The task:
# Break the program into separate classes (each class in a separate file)
# Divide the trains into two types PassengerTrain and CargoTrain, make a parent
# for the classes, which will contain common methods and properties
# Determine which methods can be placed in private / protected and place them
# in such a section. In the commentary on the method, justify why it was
# submitted in private / protected
# Wagons are now divided into freight and passenger (separate classes).
# Only passenger trains can be attached to a passenger train, freight trains
# can be attached to a freight train. When adding a wagon to a train,
# the wagon object should be stored in the internal array of the train,
# in contrast to the previous task, where we counted only the number of wagons.
# The constructor parameter "number of cars" can be deleted.
# The complicated task: to create a program in the main.rb file, which will
# allow the user to do the following through a text interface:
# - Create stations
# - Create trains
# - Add cars to the train
# - Unhook the cars from the train
# - Put trains to the station
# - View the list of stations and the list of trains at the station

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
         'remove cars, enter resize! To view the list of stations, enter ' \
          'view all, to add train on station enter add train! ' \
         'To stopped enter stop!'

def new_cargo_train
  puts 'Please, input id of new cargo train!'
  id = gets.chomp
  @train_arr << CargoTrain.new(id)
end

def new_passenger_train
  puts 'Please, input id of new passenger train!'
  id = gets.chomp
  @train_arr << PassengerTrain.new(id)
end

def new_cargo_car
  puts 'Enter id of cargo car!'
  id = gets.chomp
  @car = CargoCar.new(id)
end

def new_passenger_car
  puts 'Enter id of passenger car!'
  id = gets.chomp
  @car = PassengerCar.new(id)
end

def new_station
  puts 'Please, input name of new station!'
  name = gets.chomp
  @station_arr << Station.new(name)
end

def add_car
  puts 'Enter train id!'
  puts @train_arr
  id = gets.chomp
  puts 'Enter id of your car!'
  car_id = gets.chomp
  train_obj = @train_arr.find { |train| train.id == id }
  car_obj = @car_arr.find { |car| car.car_id == car_id }
  train_obj.add_car(car_obj)
end

def remove_car
  puts 'Enter train id!'
  puts @train_arr
  id = gets.chomp
  puts 'Enter id of your car!'
  car_id = gets.chomp
  train_obj = @train_arr.find { |train| train.id == id }
  car_obj = @car_arr.find { |car| car.car_id == car_id }
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
  else
    'Incorrect input!'
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
  when 'resize'
    puts 'You want to add or remove car?'
    add_or_del = gets.chomp
    case add_or_del
    when 'add' then add_car
    when 'remove' then remove_car
    else
      'Make a choice, add or remove!'
    end
  else
    'Incorrect input!'
  end
end
