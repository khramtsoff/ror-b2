#!/usr/bin/ruby
require_relative 'validation'

class RailwayStation
  @@stations = []

  attr_reader :name, :trains

  validate :name, :presence

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self

    validate!
  end

  def show_trains
    puts trains
  end

  def show_number_of_trains(type)
    puts trains.count { |t| t.type == type }
  end

  def remove_train(train)
    self.trains -= [train]
  end

  def add_train(train)
    self.trains << train
  end

  def self.all
  end

  def call_trains(block)
    self.trains.each { |t| block.call(t) }
  end

  protected

end
