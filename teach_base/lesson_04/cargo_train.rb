# frozen_string_literal: true

# Class CargoTrain:
class CargoTrain < Train
  def initialize(id, train_type = 'cargo', number_of_cars = 10)
    @id = id
    @train_type = train_type
    @number_of_cars = number_of_cars
    @speed = 0
    @position = 0
  end

  @prev_position = proc { route.route_array[@position - 1].positive? }
  @next_position = proc { route.route_array[@position].positive? }

  def speed_up
    self.speed += 10 if @speed < 100
  end

  def to_s
    "cargo train #{@id}"
  end
end
