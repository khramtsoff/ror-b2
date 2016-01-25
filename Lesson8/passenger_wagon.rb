#!/usr/bin/ruby

require_relative 'wagon'

class PassengerWagon < Wagon
  attr_accessor :total_seats
  attr_reader :taken_seats

  def initialize(total_seats)
    @type = Train::PASSENGER
    @total_seats = total_seats
  end

  def take_seat
    self.taken_seats += 1 if taken_seats < total_seats
  end

  def free_seats
    total_seats - self.taken_seats
  end

  def to_s
    "#{type}-#{free_seats}-#{taken_seats}"
  end

  protected

  attr_writer :taken_seats
end
