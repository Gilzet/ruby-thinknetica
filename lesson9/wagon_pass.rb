# frozen_string_literal: true

class WagonPass < Wagon
  include Validation

  PASS_TYPE = :pass
  SEAT_RESERVED = 'Seat reserved!'
  WAGON_FULL = 'Wagon is full!'
  attr_reader :seats, :reserved_seats

  validate :seats, :presence
  validate :seats, :type, Integer

  def initialize(seats)
    @type = PASS_TYPE
    @seats = seats
    @reserved_seats = 0
    super()
  end

  def non_reserved_seats
    seats - reserved_seats
  end

  def reserve_seat
    if reserved_seats < seats
      self.reserved_seats += 1
      SEAT_RESERVED
    else
      WAGON_FULL
    end
  end

  private

  attr_writer :reserved_seats
end
