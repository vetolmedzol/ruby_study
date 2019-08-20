# frozen_string_literal: true

# Class CargoCar
class CargoCar < Car
  include Company
  attr_accessor :capacity, :work_volume, :car_id
  # attr_reader :car_id

  def initialize(capacity = 70)
    @car_id = object_id
    @capacity = capacity.to_i
    @work_volume = capacity.to_i
    validate!
  end

  def take_place(volume)
    value = volume.to_i
    self.work_volume -= value if @work_volume.positive? && value < @work_volume
  end

  def free_capacity
    @work_volume
  end

  def occupied_volume
    self.capacity -= @work_volume
  end

  def to_s
    "car #{@car_id}"
  end
end
