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
    @freight_array = []
  end

  def add_train(train)
    puts "#{train} in the station #{@name}!"
    @train_array << train.to_s
    if train.train_type == 'passanger'
      @pass_array << train.to_s
    elsif train.train_type == 'freight'
      @freight_array << train.to_s
    end
  end

  def current_train_list
    @train_array
  end

  def train_type_list
    "Passanger list #{@pass_array},  freight list #{@freight_array}"
  end

  def send_train(train)
    @train_array.delete(train.to_s)
    "#{train} is left! Choo-chooo!"
  end

  def to_s
    @name
  end
end
