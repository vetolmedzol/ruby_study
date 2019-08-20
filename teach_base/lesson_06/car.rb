# frozen_string_literal: true

require_relative 'company'

# Class Car
class Car
  include Company
  attr_accessor :capacity, :car_id

  def initialize(car_id, capacity)
    @capacity = capacity
    @car_id = car_id
    validate!
  end

  def to_s
    "car #{@car_id}"
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  protected

  def validate!
    raise 'Car capacity can\'t be negative!' if capacity.negative?

    raise 'car_id can\'t be nil!' if car_id.eql?('')
  end
end
