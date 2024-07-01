# frozen_string_literal: true

class Wagon
  include Vendor

  WAGON_TYPES = %i[cargo pass]
  attr_reader :type, :train

  def initialize(type = nil)
    @type = type unless type.nil?
    validate!
  end

  def set_train(train)
    set_train!(train) if train.wagons.include?(self)
  end

  def reset_train
    set_train!(nil)
  end

  def valid?
    validate!
    true
  rescue
    false
  end

protected

  attr_writer :train

  def set_train!(train)
    self.train = train
  end

  def validate!
    raise "ERROR: Type can't be nil" if type.nil?
    raise "ERROR: Type should be cargo OR passenger" unless WAGON_TYPES.include?(type)
  end
end
