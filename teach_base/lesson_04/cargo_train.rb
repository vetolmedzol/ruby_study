# frozen_string_literal: true

# Class CargoTrain:
class CargoTrain < Train
  def initialize(id)
    @id = id
    @number_of_cars = []
    @speed = 0
    @position = 0
  end

  @prev_position = proc {route.route_array[@position - 1].positive?}
  @next_position = proc {route.route_array[@position].positive?}

  def speed_up
    self.speed += 10 if @speed < 100
  end

  def add_car(car)
    if speed.zero? && car.class.to_s == 'CargoCar'
      @number_of_cars << car
    else
      'You can add cars only appropriate type!'
    end
  end

  def to_s
    "cargo train #{@id}"
  end
end
