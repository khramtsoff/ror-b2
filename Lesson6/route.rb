#!/usr/bin/ruby

require_relative 'railwaystation'

class Route
  @stations = []
  
  def initialize(start, final)
    @stations << start
    @stations << final
    
    validate!
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
  
  def valid?
    validate!
  rescue 
    false
  end
  
  protected 
  
  def validate!
    raise "wrong station class" if @stations.any? { |x| !x.kind_of? RailwayStation}
    true
  end

end