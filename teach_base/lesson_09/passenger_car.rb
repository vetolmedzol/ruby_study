# frozen_string_literal: true

# Class PassengerCar
class PassengerCar < Car
  include Company
  attr_accessor :capacity, :seating
  attr_reader :car_id

  def initialize(seating = 30)
    @car_id = object_id
    @capacity = seating.to_i
    @seating = seating.to_i
    validate!
  end

  def take_place
    self.seating -= param if @seating.positive?
  end

  def free_place
    seating
  end

  def occupied_places
    @capacity - @seating
  end

  def to_s
    "car #{@car_id}"
  end
end
