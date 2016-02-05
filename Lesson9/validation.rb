module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, type, *args)
      case type
        when :presence
        when :format

        when :type

      end

    end

    module InstanceMethods
      def validate!
        fail 'name' if name.to_s == ''
        true
      end

      def valid?
        validate!
      rescue
        false
      end
    end
  end
end

