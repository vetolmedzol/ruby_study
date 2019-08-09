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
    @start_station = start_station.name
    @end_station = end_station.name
    @route_array = [@start_station, @end_station]
  end

  def add_station(station)
    @route_array.delete(@end_station)
    @route_array << station.name
    @route_array << @end_station
  end

  def remove_station(name)
    @route_array.delete(name)
  end

  def station_list
    @route_array
  end
end
