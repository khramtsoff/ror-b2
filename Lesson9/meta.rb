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
		
		def strong_attr_acessor
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
  puts t.test

  t.test = "456"

  puts "History"
  puts t.test_history

end