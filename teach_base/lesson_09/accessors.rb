# frozen_string_literal: true

# Module Accessors
module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  # module for Class methods
  module ClassMethods
    def method_history(method_name)
      define_method("#{method_name}=") do |value|
        history = instance_variable_get("@#{method_name}_history")
        history ||= []
        history << value
        instance_variable_set("@#{method_name}_history", history)
        instance_variable_set("@#{method_name}", value)
      end
    end

    def attr_accessor_with_history(*methods)
      methods.each do |method|
        method_name = method.to_sym
        define_method(method_name.to_s) do
          instance_variable_get("@#{method_name}")
        end
        method_history(method_name)

        define_method("#{method_name}_history") do
          instance_variable_get("@#{method_name}_history") || []
        end
      end
    end
  end

  def strong_attr_accessor(method, type)
    define_method(method) do
      instance_variable_get("@#{method}")
    end

    define_method("#{method}=") do |val|
      raise TypeError, "value is not #{type}" unless val.is_a?(type)

      instance_variable_set("@#{method}", val)
    end
  end
end
