# frozen_string_literal: true

class TrainCargo < Train
  CARGO_TYPE = :cargo

  def initialize(number)
    @type = CARGO_TYPE
    super
  end
end
