#!/usr/bin/ruby

require_relative 'train'
require_relative 'producer'

class Wagon
  include Producer

  attr_accessor :type

  def initialize(type)
    @type = type

    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    fail 'type' if type.to_s == ''
    true
  end
end
