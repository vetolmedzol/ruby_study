# frozen_string_literal: true

require_relative 'company'
require_relative 'instance_counter'

# Class Car
class Car
  include Company
  include InstanceCounter
  attr_accessor :capacity
  attr_reader :car_id

  def initialize(capacity)
    @capacity = capacity
    @car_id = object_id
    validate!
    register_instance
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
