# frozen_string_literal: true

# Class PassengerTrain:
class PassengerTrain < Train
  def initialize(id, train_type = 'passenger', number_of_cars = 5)
    @id = id
    @train_type = train_type
    @number_of_cars = number_of_cars
    @speed = 0
    @position = 0
  end

  @prev_position = proc { route.route_array[@position - 1].positive? }
  @next_position = proc { route.route_array[@position].positive? }

  def speed_up
    self.speed += 10 if @speed < 150
  end

  def to_s
    "passenger train #{@id}"
  end
end
