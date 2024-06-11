# frozen_string_literal: true

class TrainCargo < Train
  CARGO_TYPE = :cargo

  def initialize(number)
    super
    @type = CARGO_TYPE
  end

  def add_wagon(wagon)
    super if wagon.type == CARGO_TYPE
  end
end
