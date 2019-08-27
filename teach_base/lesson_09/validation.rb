# frozen_string_literal: true

# Validation
module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # ClassMethods
  module ClassMethods
    attr_accessor :validations

    def validate(method, name, arg = nil)
      @validations ||= []
      @validations.push [method, name, arg]
    end
  end

  # InstanceMethods
  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        send validation[0], instance_variable_get("@#{validation[1]}"),
             validation[2]
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    private

    def presence(name, _args)
      raise "#{name} can not be nil or empty" if name.to_s.empty?
    end

    def format(name, format)
      raise 'Number has invalid format' unless name =~ format
    end

    def type(name, type)
      raise "Wrong type of argument: #{name}" unless name.is_a?(type)
    end
  end
end
