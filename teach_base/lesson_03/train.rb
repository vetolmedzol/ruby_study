# frozen_string_literal: true

# Class Train:

# It has a number (arbitrary line) and type (freight, passenger)
# and the number of cars, these data are indicated when creating
# an instance of the class
# Can pick up speed
# Can show current speed
# May brake (slow down to zero)
# Can show the number of cars
# It can attach / detach cars (one car per operation, the method simply
# increases or decreases the number of cars). Wagon coupling / uncoupling
# can only be carried out if the train is not moving.
# Can take a route (object of class Route)
# It can move between stations indicated in the route.
# Show previous station, current, next, based on route
class Train
  attr_accessor :speed, :id, :number_of_cars, :train_type

  def initialize(id, train_type, number_of_cars = 5)
    @id = id
    @train_type = train_type
    @number_of_cars = number_of_cars
    @speed = 0
    @position = 0
  end

  @prev_position = proc { route.route_array[@position - 1].positive? }
  @next_position = proc { route.route_array[@position].positive? }

  def current_speed
    @speed
  end

  def speed_up
    self.speed += 10 if @speed < 120
  end

  def stop
    self.speed = 0
  end

  def current_cars
    @number_of_cars
  end

  def add_car
    self.number_of_cars += 1 if speed.zero?
  end

  def remove_car
    self.number_of_cars -= 1 if speed.zero? && number_of_cars.positive?
  end

  def current_position(route)
    "Previous station #{route.route_array[@position - 1]}" if @prev_position
    "Next station is #{route.route_array[@position + 1]}" if @next_position
    "Current station #{route.route_array[@position]}"
  end

  def move_forward(route)
    @position += 1 unless route.route_array[@position + 1].nil?
    route.route_array[@position]
  end

  def move_back(route)
    @position -= 1 unless route.route_array[@position - 1].nil?
    route.route_array[@position]
  end

  def to_s
    "train #{@id}"
  end
end