# frozen_string_literal: true

class Route
  attr_reader :start_station, :end_station, :way_stations

  def initialize(start_station, end_station)
    @start_station, @end_station = start_station, end_station
    @way_stations = []
  end

  def stations
    [@start_station] + @way_stations + [@end_station]
  end

  def add_station(way_station)
    @way_stations << way_station unless stations.include?(way_station)
  end

  def remove_station
    @way_stations.pop unless @way_stations.empty?
  end
end
