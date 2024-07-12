# frozen_string_literal: true

class Wagon
  include Vendor

  WAGON_TYPES = %i[cargo pass].freeze
  attr_reader :type, :train

  def initialize(type = nil)
    @type = type unless type.nil?
    validate!
  end

  def train=(train)
    @train = train if train.wagons.include?(self)
  end

  def reset_train
    @train = nil
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  protected

  def validate!
    raise ArgumentError, "ERROR: Type can't be nil" if type.nil?
    raise ArgumentError, 'ERROR: Type should be cargo OR passenger' unless WAGON_TYPES.include?(type)
  end
end
