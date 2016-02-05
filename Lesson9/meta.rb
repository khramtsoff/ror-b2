#!/usr/bin/ruby

module Meta
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def att_accessor_with_history(*args)
      args.each do |name|
        define_method("#{name}=") do |val|
          instance_variable_set("@#{name}", val)
          h = instance_variable_get("@#{name}_history")
          h ||= []
          h << val
          instance_variable_set("@#{name}_history", h)
        end

        define_method("#{name}") do
          instance_variable_get("@#{name}")
        end

        define_method("#{name}_history") do
          instance_variable_get("@#{name}_history")
        end
      end
    end


    def strong_attr_acessor(name, cl)
      define_method("#{name}=") do |val|
        raise "Wrong class" unless val.instance_of? cl
        instance_variable_set("@#{name}", val)
      end

      define_method("#{name}") do
        instance_variable_get("@#{name}")
      end
    end
  end

  module InstanceMethods
  end
end


class Test
  include Meta

end


module Validation
  def validate
  end

  def validate!
  end

  def valid?
  end
end

if __FILE__ == $PROGRAM_NAME

  Test.att_accessor_with_history(:test)

  t = Test.new

  t.test = "123"
  t.test = "456"

  puts t.test_history

  Test.strong_attr_acessor(:strong, String)

  t = Test.new

  t.strong = "test"
  puts t.strong

  t.strong = 123
  puts t.strong

end