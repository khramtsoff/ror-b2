module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    @validators = []
    def validate(name, type, *args)
      validators << [name, type, args]
    end

    def validators
      @validators ||= []
    end
  end


  module InstanceMethods
    def validate!
      self.class.validators.each do |name, type, *args|
        self.send(type, instance_variable_get("@#{name}"), *args)
      end
      true
    end

    def presence(var, *args)
      raise "empty" if var.nil?
    end

    def format(var, *args)
      raise "format" if var !~ args.first
    end

    def type(var, *args)
      puts var.class
      puts var
      raise "type" unless var.instance_of?(args.flatten.first)
    end

    def array_type(var, *args)
      raise "array_type" if var.any? { |x| !x.instance_of? args.first}
    end

    def custom!
      raise "custom" if !yield
    end

  def valid?
    validate!
  rescue
    false
  end
  end
end

class A
  include Validation

  attr_accessor :x, :y
  validate :x, :presence
  validate :y, :type, String

  def test
    self.class.validators
  end

end

a = A.new
# a.test

a.x = 123
a.y = "one"

a.validate!