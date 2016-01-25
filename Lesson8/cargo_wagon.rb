#!/usr/bin/ruby

require_relative 'wagon'

class CargoWagon < Wagon
  attr_accessor :total_space
  attr_reader :taken_space

  def initialize(total_space)
    @type = Train::CARGO
    @total_space = total_space
  end

  def taken_space(space)
    self.taken_space += space if taken_space + space < total_space
  end

  def free_space
    total_space - self.taken_space
  end

  def to_s
    "#{type}-#{free_space}-#{taken_space}"
  end

  protected

  attr_writer :taken_space
end
