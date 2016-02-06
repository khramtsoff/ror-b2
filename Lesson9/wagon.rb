#!/usr/bin/ruby

require_relative 'train'
require_relative 'producer'
require_relative 'validation'

class Wagon
  include Producer
  include Validation

  attr_accessor :type

  validate :type, :presence

  def initialize(type)
    @type = type

    validate!
  end
end
