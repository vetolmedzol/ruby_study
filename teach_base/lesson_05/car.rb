# frozen_string_literal: true

# Class Car
class Car
  include Company
  attr_accessor :capacity, :car_id

  def initialize(car_id, capacity)
    @capacity = capacity
    @car_id = car_id
  end

  def to_s
    "car #{@car_id}"
  end
end
