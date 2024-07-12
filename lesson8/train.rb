# frozen_string_literal: true

class Train
  include InstanceCounter
  include Vendor

  @all ||= []

  class << self
    attr_reader :all

    def find(number)
      @all.find { |train| train.number == number }
    end
  end

  TRAIN_TYPES = %i[cargo pass].freeze
  attr_reader :number, :type, :speed, :wagons, :route, :station, :station_number

  def initialize(number, type = nil)
    @number = number
    @speed = 0
    @wagons = []
    @type = type unless type.nil?
    @all << self
    validate!
    register_instance
  end

  def speed_up(additional_speed = DEFAULT_ADDITIONAL_SPEED)
    speed_up!(additional_speed)
  end

  def stop
    stop!
  end

  def add_wagon(wagon)
    raise ArgumentError, "Add wagon failed, type mismatch #{wagon.type} and #{type}" if wagon.type != type
    raise ArgumentError, "Add wagon failed, train is moving. Current speed = #{speed}" unless speed.zero?
    raise ArgumentError, "Add wagon failed, #{wagon} is already attached" if wagons.include?(wagon)

    add_wagon!(wagon)
  end

  def remove_wagon(wagon)
    remove_wagon!(wagon) if speed.zero? && wagons.include?(wagon)
  end

  def route=(route)
    return if route.nil?

    self.route&.remove_train(self)
    @route = route
    route.add_train(self)
    self.station_number = START_STATION_NUMBER
    move_to_new_station!
  end

  def go_next_station
    go_next_station! if station_number < route.stations.size - 1
  end

  def go_prev_station
    go_prev_station! if station_number > START_STATION_NUMBER
  end

  def show_next_station
    route.stations[station_number + 1]
  end

  def show_cur_station
    station
  end

  def show_prev_station
    route.stations[station_number - 1]
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def each_wagon(&block)
    wagons.each_with_index(&block)
    nil
  end

  protected

  START_STATION_NUMBER = 0
  DEFAULT_ADDITIONAL_SPEED = 10
  NUMBER_FORMAT = /^\p{Alnum}{3}-?\p{Alnum}{2}$/i.freeze
  attr_writer :speed, :station, :station_number

  def speed_up!(additional_speed)
    self.speed += additional_speed
  end

  def stop!
    self.speed = 0
  end

  def add_wagon!(wagon)
    wagons << wagon
    wagon.train = self
  end

  def remove_wagon!(wagon)
    wagons.delete(wagon)
    wagon.reset_train
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
    station&.send_train(self)
    self.station = route.stations[station_number]
    station.take_train(self)
  end

  def validate!
    raise ArgumentError, "ERROR: Number can't be nil" if number.nil?
    raise ArgumentError, 'ERROR: Number should be at least 5 symbols' if number.to_s.length < 5
    raise ArgumentError, 'ERROR: Number should have format: xxx-xx OR xxxxx' if number !~ NUMBER_FORMAT

    raise ArgumentError, "ERROR: Type can't be nil" if type.nil?
    raise ArgumentError, 'ERROR: Type should be cargo OR passenger' unless TRAIN_TYPES.include?(type)
  end
end
