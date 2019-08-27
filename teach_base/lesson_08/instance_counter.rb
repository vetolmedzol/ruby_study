# frozen_string_literal: true

# module InstanceCounter
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # module ClassMethods
  module ClassMethods
    attr_accessor :instances
  end

  # module InstanceMethods
  module InstanceMethods
    protected

    def register_instance
      self.class.instances ||= 0
      self.class.instances += 1
    end
  end
end
