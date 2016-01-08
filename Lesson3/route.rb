#!/usr/bin/ruby

class Route
  @stations = []
  
  def initialize(start, final)
    @stations << start
    @stations << final
  end

  def add_station(station)
    @stations.insert(@stations.size-1, station)    
  end

  def remove_station(station)
    @stations -= [station];
  end

  def print_stations
    puts @stations
  end
end