# frozen_string_literal: true

# Station Class:

# Has a name
# Can take trains (one at a time)
# Can show a list of all trains at stations currently located
# It can show the list of trains at the station (see below):
# number of freight, passenger
# The train is removed from the list of trains used at the station.
class Station
  attr_accessor :name

  def initialize(name)
    @name = name
    @train_array = []
    @pass_array = []
    @cargo_array = []
  end

  def add_train(train)
    if train.class == Train
      puts "#{train} in the station #{@name}!"
      @train_array << train
      @passenger_array << train if train.train_type == :passenger
      @cargo_array << train if train.train_type == :freight
    else
      'You can add only Train!'
    end
  end

  def current_train_list
    @train_array
  end

  def train_type_list
    "Passanger list #{@pass_array},  cargo list #{@cargo_array}"
  end

  def send_train(train)
    @train_array.delete(train)
    if train.train_type == :passenger
      @passenger_array.delete(train)
    elsif train.train_type == :freight
      @cargo_array.delete(train)
    end
  end

  def to_s
    @name
  end
end
