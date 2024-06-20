# frozen_string_literal: true

class Train
  TRAIN_TYPES = %i[cargo pass]
  attr_reader :number, :type, :speed, :wagons, :route, :station, :station_number

  def initialize(number, type=nil)
    @number = number
    @speed = 0
    @wagons = []
    @type = type if TRAIN_TYPES.include?(type)
  end

  def speed_up(additional_speed = DEFAULT_ADDITIONAL_SPEED)
    speed_up!(additional_speed)
  end

  def stop
    stop!
  end

  def add_wagon(wagon)
    raise "Add wagon failed, type mismatch #{wagon.type} and #{type}" if wagon.type != type
    raise "Add wagon failed, train is moving. Current speed = #{speed}" unless speed.zero?
    raise "Add wagon failed, #{wagon} is already attached" if wagons.include?(wagon)
    add_wagon!(wagon)
  end

  def remove_wagon(wagon)
    remove_wagon!(wagon) if speed.zero? && wagons.include?(wagon)
  end

  def route=(route)
    self.set_route=(route)
  end

  def go_next_station
    go_next_station! if station_number < route.stations.size - 1
  end

  def go_prev_station
    go_prev_station! if station_number > START_STATION_NUMBER
  end

  def show_next_station
    route.stations[station_number+1]
  end

  def show_cur_station
    station
  end

  def show_prev_station
    route.stations[station_number-1]
  end

  protected

  START_STATION_NUMBER = 0
  DEFAULT_ADDITIONAL_SPEED = 10
  attr_writer :speed, :route, :station, :station_number

  def speed_up!(additional_speed)
    self.speed += additional_speed
  end

  def stop!
    self.speed = 0
  end

  def add_wagon!(wagon)
    wagons << wagon
    wagon.set_train(self)
  end

  def remove_wagon!(wagon)
    wagons.delete(wagon)
    wagon.reset_train
  end

  def set_route=(route)
    return if route.nil?

    route.delete(self) unless self.route.nil?
    self.route = route
    route.add_train(self)
    self.station_number = START_STATION_NUMBER
    move_to_new_station!
  end

  def go_next_station!
    self.station_number += 1
    move_to_new_station!
  end

  def go_prev_station!
    self.station_number -= 1
    move_to_new_station!
  end

  def move_to_new_station!
    station.send_train(self) unless station.nil?
    self.station = route.stations[station_number]
    station.take_train(self)
  end
end
