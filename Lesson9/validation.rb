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
      # fail 'name' if name.to_s == ''
      self.class.validators.each do |name, type, args|
        v = instance_variable_get("@#{name}")
        puts type
        case type
          when :presence
            raise "empty" if v.nil?
          when :format
            raise "format" if v !~ args.first
          when :type
            raise "type" unless v.instance_of?(args.first)
          else
            raise "invalid type"
        end
      end
      true
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

