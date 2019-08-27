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
require_relative 'instance_counter'
require_relative 'company'
# class Train
class Train
  include InstanceCounter
  include Company
  attr_accessor :speed, :id, :train_type, :number_of_cars
  attr_writer :route

  NUMBER_FORMAT = /^[a-z\d]{3}-?[a-z\d]{2}$/i.freeze

  def initialize(id, train_type)
    @id = id
    train_type = :passenger unless correct_train_type?(train_type)
    @train_type = train_type.to_sym
    @number_of_cars = []
    @speed = 0
    @position = 0
    @route = nil
    register_instance
    validate!
  end

  def self.find(train_id)
    ObjectSpace.each_object(self).to_a.find { |train| train.id == train_id }
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def correct_train_type?(train_type)
    train_type_arr = [:cargo, :passenger, 'cargo', 'passenger']
    train_type_arr.include?(train_type)
  end

  def prev_position?
    !@route.route_array[@position - 1].nil?
  end

  def next_position?
    !@route.route_array[@position].nil?
  end

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

  def add_car(car)
    @number_of_cars << car if speed.zero? && @number_of_cars.length < 50
  end

  def remove_car(car)
    @number_of_cars.delete(car) if speed.zero? && @number_of_cars.size.positive?
  end

  def current_position
    "Previous station #{@route.route_array[@position - 1]}" if prev_position?
    "Next station is #{@route.route_array[@position + 1]}" if next_position?
    "Current station #{@route.route_array[@position]}"
  end

  def moving
    @position += 1 unless @route.route_array[@position + 1].nil?
    @route.route_array[@position - 1].send_train(self)
    @route.route_array[@position].add_train(self)
    @route.route_array[@position]
  end

  def move_forward
    if @route.route_array[@position] == @route.route_array.last
      'You at the end!'
    else
      moving
    end
  end

  def each_car
    @number_of_cars.each { |e| yield(e) }
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  protected

  def validate!
    raise 'Train id can\'t be nil' if id.nil?

    raise 'Number has invalid format' if id !~ NUMBER_FORMAT

    true
  end
end
