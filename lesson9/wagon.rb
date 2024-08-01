# frozen_string_literal: true

class Wagon
  include Validation

  WAGON_TYPES = %i[cargo pass].freeze
  attr_reader :type, :train

  validate :type, :presence

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
end
