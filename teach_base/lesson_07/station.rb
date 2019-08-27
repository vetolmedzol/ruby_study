# frozen_string_literal: true

# Station Class:

# Has a name
# Can take trains (one at a time)
# Can show a list of all trains at stations currently located
# It can show the list of trains at the station (see below):
# number of freight, passenger
# The train is removed from the list of trains used at the station.

require_relative 'instance_counter'
# class Station
class Station
  include InstanceCounter
  attr_accessor :name, :train_array

  def initialize(name)
    @name = name
    @train_array = []
    @passenger_array = []
    @cargo_array = []
    register_instance
    validate!
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def add_train(train)
    if train.is_a?(Train)
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
    "Passenger list #{@passenger_array},  cargo list #{@cargo_array}"
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

  def valid?
    validate!
  rescue StandardError
    false
  end

  def each_train
    @train_array.each { |e| yield(e) }
  end

  protected

  def validate!
    raise 'Name of station can\'t be nil!' if name.eql?('')

    true
  end
end
