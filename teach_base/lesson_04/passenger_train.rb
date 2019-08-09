# frozen_string_literal: true

# Class PassengerTrain:
class PassengerTrain < Train
  def initialize(id)
    @id = id
    @number_of_cars = []
    @speed = 0
    @position = 0
  end

  @prev_position = proc {route.route_array[@position - 1].positive?}
  @next_position = proc {route.route_array[@position].positive?}

  def speed_up
    self.speed += 10 if @speed < 150
  end

  def add_car(car)
    if speed.zero? && car.class.to_s == 'PassengerCar'
      @number_of_cars << car
    else
      'You can add cars only appropriate type!'
    end
  end

  def to_s
    "passenger train #{@id}"
  end
end
