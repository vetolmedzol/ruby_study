# frozen_string_literal: true

require_relative 'train'
# Class CargoTrain:
class CargoTrain < Train
  include Company
  def initialize(id)
    @id = id
    @train_type = :cargo
    @number_of_cars = []
    @speed = 0
    @position = 0
    @route = nil
  end

  def prev_position?
    !@route.route_array[@position - 1].nil?
  end

  def next_position?
    !@route.route_array[@position].nil?
  end

  def speed_up
    self.speed += 10 if @speed < 100
  end

  def add_car(car)
    if speed.zero? && car.class == CargoCar
      @number_of_cars << car
    else
      'You can add cars only appropriate type!'
    end
  end

  def to_s
    "cargo train #{@id}"
  end
end