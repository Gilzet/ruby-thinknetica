# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    VALIDATION_TYPES = %i[presence format type].freeze

    def validate(arg, validation_type, param = nil)
      raise ArgumentError, 'ERROR: Wrong validation type' unless VALIDATION_TYPES.include?(validation_type)

      case validation_type
      when :presence then presence_check(arg)
      when :format then format_check(arg, param)
      when :type then type_check(arg, param)
      end
    end

    private

    def presence_check(arg)
      define_method("validate_#{arg}_presence") do
        var_name = "@#{arg}".to_sym
        value = instance_variable_get(var_name)
        raise ArgumentError, "ERROR: #{var_name} can't be nil or empty" if value.nil? || value.to_s.empty?
      end
    end

    def format_check(arg, format)
      define_method("validate_#{arg}_format") do
        var_name = "@#{arg}".to_sym
        value = instance_variable_get(var_name)
        raise ArgumentError, "ERROR: #{var_name} should be in format #{format}" if value !~ format
      end
    end

    def type_check(arg, class_name)
      define_method("validate_#{arg}_type") do
        var_name = "@#{arg}".to_sym
        value = instance_variable_get(var_name)
        raise ArgumentError, "ERROR: #{var_name}'s type should be #{class_name}" unless value.is_a? class_name
      end
    end
  end

  module InstanceMethods
    def validate!
      methods.grep(/^validate_/).each { |method| send(method) }
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end
end
