# frozen_string_literal: true

# Class Route:

# It has a start and end station, as well as a list of intermediate stations.
# The startingand ending stations are indicated when creating a route,
# and intermediate stations can be added between them.
# May add an intermediate station to the list
# May remove an intermediate station from the list
# It can list all stations in order from start to end
class Route
  attr_accessor :route_array

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @route_array = [@start_station, @end_station]
  end

  def add_station(station)
    if @route_array.include?(station)
      'Station is already in your route!'
    else
      @route_array.insert(-2, station)
    end
  end

  def remove_station(station)
    if station.eql?(@start_station || @end_station)
      'You can not remove first or last station!'
    else
      @route_array.delete(station)
    end
  end

  def station_list
    @route_array
  end
end
