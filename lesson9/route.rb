# frozen_string_literal: true

class Route
  include InstanceCounter
  include Validation

  attr_reader :start_station, :end_station, :way_stations, :trains

  validate :start_station, :presence
  validate :start_station, :type, Station
  validate :end_station, :presence
  validate :end_station, :type, Station

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @way_stations = []
    @trains = []
    validate!
    register_instance
  end

  def stations
    [start_station] + way_stations + [end_station]
  end

  def add_station(way_station)
    add_station!(way_station) unless stations.include?(way_station)
  end

  def remove_way_station(way_station)
    remove_station!(way_station) if way_stations.include?(way_station)
  end

  def add_train(train)
    add_train!(train) if !trains.include?(train) && train.route == self
  end

  def remove_train(train)
    remove_train!(train) if trains.include?(train)
  end

  private

  def add_station!(way_station)
    way_stations << way_station
  end

  def remove_station!(way_station)
    way_stations.delete(way_station)
  end

  def add_train!(train)
    trains << train
  end

  def remove_train!(train)
    trains.delete(train)
  end
end
