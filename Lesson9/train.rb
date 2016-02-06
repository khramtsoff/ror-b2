#!/usr/bin/ruby

require_relative 'producer'
require_relative 'validation'

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    @counter
    def instances
      @counter
    end
  end

  module InstanceMethods
    private

    def register_instance
    end
  end
end

class Train
  include Producer
  include Validation

  NUMBER_FORMAT = /^([a-zа-я]{3}|\d{3})-{0,1}([a-zа-я]{2}|\d{2})$/i

  CARGO = 'cargo'.freeze
  PASSENGER = 'passenger'.freeze

  validate :train_number, :presence
  validate :train_number, :format, NUMBER_FORMAT
  validate :length, :presence
  validate :speed, :presence
  validate :train_number, :custom, lambda {self.class.find(train_number.to_s.to_sym)}

  @@trains = {}

  @wagons = []

  attr_accessor :route
  attr_reader :length, :route_index, :speed, :type, :train_number

  def self.all
    @@trains
  end

  def self.find(index)
    @@trains[index]
  end

  def self.trains
    @@trains
  end

  def initialize(train_number, type, length)
    @train_number = train_number
    @type = type
    @length = [0, length].max
    @speed = speed

    validate!

    @@trains[train_number.to_s.to_sym] = self
  end

  def stop
    self.speed = 0
  end

  def speed_up(delta)
    self.speed += delta
  end

  def speed_down(delta)
    self.speed -= delta
  end

  def add_wagon(wagon = Wagon.new(type))
    fail 'wrong type' if wagon.type != type
    if self.speed == 0 && wagon.type == type
      self.length += 1
      @wagons << wagon
    end
  end

  def remove_wagon
    self.length -= 1 if self.speed == 0 && self.length > 0
  end

  def next_station
    self.route_index += 1 if route && route.stations.length < self.length - 1
  end

  def route=(route)
    @route = route
    self.route_index = 0
  end

  def route_index=(route_index)
    @route_index = route_index
    route[route_index].current_train = self
  end

  def route_description
    if route
      prev = route_index - 1 >= 0 ? @route[route_index - 1] : "нет"
      current = route[route_index]

      puts "предыдущая - #{prev}, текущая - #{current}, \
            следующая - #{following}"
    else
      puts "Нет маршрута"
    end
  end

  def following
    if route_index + 1 < @route.stations.length
      @route[route_index + 1]
    else
      "нет"
    end
  end

  def call_wagons(block)
    @@wagons.each_with_index { |w, i| block.call(w, i) }
  end

  protected

  attr_writer :type, :speed, :train_number
end
