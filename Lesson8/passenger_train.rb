#!/usr/bin/ruby
require_relative 'train'

class PassangerTrain < Train
  def initialize
    @type = Train::PASSENGER
  end
end
