# frozen_string_literal: true

# Class PassengerCar
class PassengerCar < Car
  include Company
  attr_accessor :capacity, :car_id

  def initialize(car_id, capacity = 30)
    @capacity = capacity
    @car_id = car_id
    validate!
  end

  def to_s
    "car #{@car_id}"
  end
end
