# frozen_string_literal: true

class WagonCargo < Wagon
  include Validation

  CARGO_TYPE = :cargo
  LOADED = 'Cargo loaded!'
  NOT_LOADED = 'Cargo is too big to load!'
  attr_reader :volume, :occupied_volume

  validate :volume, :presence

  def initialize(volume)
    @type = CARGO_TYPE
    @volume = volume
    @occupied_volume = 0
    super()
  end

  def free_volume
    volume - occupied_volume
  end

  def load_cargo(load_volume)
    if occupied_volume + load_volume <= volume
      self.occupied_volume += load_volume
      LOADED
    else
      NOT_LOADED
    end
  end

  private

  attr_writer :occupied_volume
end
