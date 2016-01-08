#!/usr/bin/ruby

class Route
  @stations = []
  
  # Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
  def initialize(start, final)
    @stations << start
    @stations << final
  end

  # Может добавлять станцию в список
  def add_station(station)
    @stations.insert(@stations.size-1, station)    
  end

  # Может удалять станцию из списка
  def remove_station(station)
    @stations -= [station];
  end

  # Может выводить список всех станций по-порядку от начальной до конечной
  def print_stations
    puts @stations
  end

end