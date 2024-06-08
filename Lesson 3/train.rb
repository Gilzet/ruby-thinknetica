# frozen_string_literal: true

class Train
  attr_reader :number, :type, :wagons_count, :speed, :route, :station

  def initialize(number, type, wagons_count=0)
    @number, @type, @wagons_count = number, type, wagons_count
    @speed = 0
  end

  def speed_up(additional_speed=10)
    @speed += additional_speed
  end

  def stop
    @speed = 0
  end

  def add_wagon
    @wagons_count += 1 if @speed == 0
  end

  def remove_wagon
    @wagons_count -= 1 if @speed == 0 && @wagons_count > 0
  end

  def route=(route)
    @route, @station, @station_number = route, route.start_station, 0
  end

  def go_next_station
    @station_number += 1 if @station_number + 1 < @route.stations.size
    @station = @route.stations[@station_number]
  end

  def go_prev_station
    @station_number -= 1 if @station_number > 0
    @station = @route.stations[@station_number]
  end

  def next_station
    @route.stations[@station_number+1]
  end

  def prev_station
    @route.stations[@station_number-1]
  end
end
