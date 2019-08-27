# frozen_string_literal: true

# Class PassengerTrain:
class PassengerTrain < Train
  include Company
  def initialize(id)
    @id = id
    @train_type = :passenger
    @number_of_cars = []
    @speed = 0
    @position = 0
    @route = nil
    register_instance
    validate!
  end

  def prev_position?
    !@route.route_array[@position - 1].nil?
  end

  def next_position?
    !@route.route_array[@position].nil?
  end

  def speed_up
    self.speed += 10 if @speed < 150
  end

  def add_car(car)
    if speed.zero? && car.class == PassengerCar
      @number_of_cars << car if speed.zero? && @number_of_cars.length < 20
    else
      'You can add cars only appropriate type!'
    end
  end

  def to_s
    "passenger train #{@id}"
  end
end
