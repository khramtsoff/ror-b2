#!/usr/bin/ruby

module Meta
	def self.included(base)
		base.extend ClassMethods
		base.send :include, InstanceMethods
	end
	
	module ClassMethods
		def att_accessor_with_history
		end
	end
	
	module InstanceMethods
		def strong_attr_acessor
		end
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
	class Array
	def word

end