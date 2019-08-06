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
class Main
  require_relative 'train'
  require_relative 'cargo_train'
  require_relative 'passanger_train'
  require_relative 'route'
  require_relative 'station'

end
# Задание:
# Разделить поезда на два типа PassengerTrain и CargoTrain, сделать родителя
# для классов, который будет содержать общие методы и свойства
# Определить, какие методы могут быть помещены в private/protected и вынести
# их в такую секцию. В комментарии к методу обосновать, почему он был вынесен
# в private/protected
# Вагоны теперь делятся на грузовые и пассажирские (отдельные классы).
# К пассажирскому поезду можно прицепить только пассажирские,
# к грузовому - грузовые.
# При добавлении вагона к поезду, объект вагона должен сохраняться во внутреннем
# массиве поезда, в отличие от предыдущего задания, где мы считали только кол-во
# вагонов. Параметр конструктора "кол-во вагонов" при этом можно удалить.
#     Усложненное задание: создать программу в файле main.rb, которая будет
# позволять пользователю через текстовый интерфейс делать следующее:
# - Создавать станции
# - Создавать поезда
# - Добавлять вагоны к поезду
# - Отцеплять вагоны от поезда
# - Помещать поезда на станцию
# - Просматривать список станций и список поездов на станции
