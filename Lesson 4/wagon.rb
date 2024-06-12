# frozen_string_literal: true

class Wagon
  attr_reader :type, :train

  def initialize(type)
    @type = type
  end

  def set_train(train)
    set_train!(train) if train.wagons.include?(self)
  end

  def reset_train
    set_train!(nil)
  end

  protected

  attr_writer :train

  def set_train!(train)
    self.train = train
  end
end
