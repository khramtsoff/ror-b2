#!/usr/bin/ruby

require_relative 'railwaystation'
require_relative 'validation'

class Route
  include Validation

  @stations = []

  validate :stations, :array_type, RailwayStation

  def initialize(start, final)
    @stations << start
    @stations << final

    validate!
  end

  def add_station(station)
    @stations.insert(@stations.size - 1, station)
  end

  def remove_station(station)
    @stations -= [station]
  end

  def print_stations
    puts @stations
  end
end
