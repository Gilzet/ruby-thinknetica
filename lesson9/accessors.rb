# frozen_string_literal: true

module Accessors
  def attr_accessor_with_history(*args)
    args.each do |arg|
      var_name = "@#{arg}".to_sym

      define_method(arg) do
        var_name ||= []
        instance_variable_get(var_name.last)
      end
      define_method("#{arg}=".to_sym) { |value| instance_variable_set(var_name, var_name << value) }
      define_method("#{arg}_history".to_sym) { instance_variable_get(var_name) }
    end
  end

  def strong_attr_accessor(arg, struct)
    var_name = "@#{arg}".to_sym
    return unless struct.instance_of?(Class)

    define_method(arg) { instance_variable_get(var_name) }
    define_method("#{arg}=".to_sym) do |value|
      raise ArgumentError, "ERROR: Type must be #{struct}" if value.class != struct

      instance_variable_set(var_name, value)
    end
  end
end
