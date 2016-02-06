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
        first = args.first
        puts type
        case type
          when :presence
            raise "empty" if v.nil?
          when :format
            raise "format" if v !~ first
          when :type
            raise "type" unless v.instance_of?(first)
          when :array_type
            raise "array_type" if v.any? { |x| !x.instance_of? first}
          when :custom
            raise "custom" if !yield
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

