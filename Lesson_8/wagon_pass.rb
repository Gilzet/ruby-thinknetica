# frozen_string_literal: true

class WagonPass < Wagon
  PASS_TYPE = :pass
  SEAT_RESERVED = "Seat reserved!"
  WAGON_FULL = "Wagon is full!"
  attr_reader :seats, :reserved_seats

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

  def validate!
    super
    raise "ERROR: Seats can't be nil" if seats.nil?
    raise "ERROR: Seats should be at least 1" if seats < 1
  end
end
