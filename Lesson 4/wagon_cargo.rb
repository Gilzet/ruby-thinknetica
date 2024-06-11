# frozen_string_literal: true

class WagonCargo < Wagon
  CARGO_TYPE = :cargo

  def initialize
    @type = CARGO_TYPE
  end
end
