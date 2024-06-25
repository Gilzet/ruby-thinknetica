# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'vendor'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'train_cargo'
require_relative 'train_pass'
require_relative 'wagon'
require_relative 'wagon_cargo'
require_relative 'wagon_pass'
require_relative 'rail_text'

class RailRoad
  CARGO_TYPE = :cargo
  PASS_TYPE = :pass

  include RailText
  attr_reader :stations, :routes, :trains, :wagons


  def initialize
    @stations = []
    @routes = []
    @trains = []
    @wagons = []
    RailText.greeting
    main_menu
  end

  def main_menu
    loop do
      RailText.main_menu
      action = gets.chomp.downcase

      case action
      when "1", "s", "show" then show_menu
      when "2", "a", "add" then add_new_menu
      when "3", "l", "select" then select_menu
      when "0", "e", "exit" then exit 0
      else raise_error
      end
    end
  end

  def show_menu
    loop do
      RailText.show_menu
      action = gets.chomp.downcase

      case action
      when "1", "a", "all" then showing_items("All", info)
      when "2", "s", "stations" then showing_items("Stations", stations)
      when "3", "r", "routes" then showing_items("Routes", routes)
      when "4", "t", "trains" then showing_items("Trains", trains)
      when "5", "w", "wagons" then showing_items("Wagons", wagons)
      when "0", "b", "back" then break 0
      else raise_error; break 0
      end
    end
  end

  def add_new_menu
    loop do
      RailText.add_new_menu
      action = gets.chomp.downcase

      case action
      when "1", "s", "station" then add_new_station
      when "2", "r", "route" then add_new_route
      when "3", "t", "train" then add_new_train
      when "4", "w", "wagon" then add_new_wagon
      when "0", "b", "back" then break 0
      else raise_error; break 0
      end
    end
  end

  def select_menu
    loop do
      RailText.select_menu
      action = gets.chomp.downcase

      case action
      when "1", "s", "station" then station_menu(select_item("station", stations))
      when "2", "r", "route" then route_menu(select_item("route", routes))
      when "3", "t", "train" then train_menu(select_item("train", trains))
      when "4", "w", "wagon" then wagon_menu(select_item("wagon", wagons))
      when "0", "b", "back" then break 0
      else raise_error; break 0
      end
    end
  end

  def add_new_station
    begin
      RailText.add_new_station_name
      station_name = gets.chomp.capitalize; return if station_name == '0'

      add_station(Station.new(station_name))
    rescue RuntimeError => e
      puts e
      retry
    end

    RailText.success_add_new("station")
    wait_any_input
  end

  def add_new_route
    begin
      RailText.add_new_route

      start_station = select_item("Start station", stations)
      end_station = select_item("End station", stations)

      add_route(Route.new(start_station, end_station))
    rescue RuntimeError => e
      puts e
      return
    end

    RailText.success_add_new("route")
    wait_any_input
  end

  def add_new_train
    begin
      RailText.add_new_train_number
      train_number = gets.chomp; return if train_number == '0'

      RailText.add_new_train_type
      train_type = gets.chomp.downcase

      case train_type
      when "0", "b", "back" then return
      when "1", "c", "cargo" then add_train(TrainCargo.new(train_number))
      when "2", "p", "passenger" then add_train(TrainPass.new(train_number))
      else add_train(Train.new(train_number, train_type))
      end
    rescue RuntimeError => e
      puts e
      retry
    end

    RailText.success_add_new("train")
    wait_any_input
  end

  def add_new_wagon
  begin
    RailText.add_new_wagon_type
    wagon_type = gets.chomp.downcase

    case wagon_type
    when "0", "b", "back" then return
    when "1", "c", "cargo" then add_wagon(WagonCargo.new)
    when "2", "p", "passenger" then add_wagon(WagonPass.new)
    else add_wagon(Wagon.new(wagon_type))
    end
  rescue RuntimeError => e
    puts e
    retry
  end

    RailText.success_add_new("wagon")
    wait_any_input
  end

  def select_item(item_title, items)
    RailText.select_list_menu(item_title, items)
    index = gets.chomp.to_i - 1

    return nil if index == -1

    items[index] || raise_error
  end

  def station_menu(station)
    return if station.nil?
    loop do
      RailText.station_menu(station)
      action = gets.chomp.downcase

      case action
      when "1", "a", "all" then showing_items("All trains", station.show_trains)
      when "2", "c", "cargo" then showing_items("Cargo trains", station.show_trains(CARGO_TYPE))
      when "3", "p", "passenger" then showing_items("Passenger trains", station.show_trains(PASS_TYPE))
      when "0", "b", "back" then break 0
      else raise_error; break 0
      end
    end
  end

  def route_menu(route)
    return if route.nil?
    loop do
      RailText.route_menu(route)
      action = gets.chomp.downcase

      case action
      when "1", "s", "show" then showing_items("Route stations", route.stations)
      when "2", "a", "add" then route.add_station(select_item("station", stations - route.stations))
      when "3", "r", "remove" then route.remove_way_station(select_item("way station", route.way_stations))
      when "0", "b", "back" then break 0
      else raise_error; break 0
      end
    end
  end

  def train_menu(train)
    return if train.nil?
    loop do
      RailText.train_menu(train)
      action = gets.chomp.downcase

      case action
      when "1", "s", "show" then showing_items("Wagons", train.wagons)
      when "2", "w", "wagon" then train.add_wagon(select_item("wagon", wagons - train.wagons))
      when "3", "r", "remove" then train.remove_wagon(select_item("wagon", train.wagons))
      when "4", "a", "assign" then train.route = select_item("route", routes)
      when "5", "n", "next" then train.go_next_station unless train.route.nil?
      when "6", "p", "previous" then train.go_prev_station unless train.route.nil?
      when "0", "b", "back" then break 0
      else raise_error; break 0
      end
    end
  end

  def wagon_menu(wagon)
    return if wagon.nil?
    loop do
      RailText.wagon_menu(wagon)
      action = gets.chomp.downcase

      case action
      when "1", "t", "type" then showing_items("Type", wagon.type)
      when "2", "s", "train" then showing_items("Train", wagon.train)
      when "0", "b", "back" then break 0
      else raise_error; break 0
      end
    end
  end

  def info
    {stations: self.stations, routes: self.routes, trains: self.trains, wagons: self.wagons}
  end

  def add_station(station) add_station!(station) unless stations.include?(station) end
  def add_route(route) add_route!(route) unless routes.include?(route) end
  def add_train(train) add_train!(train) unless trains.include?(train) end
  def add_wagon(wagon) add_wagon!(wagon) unless wagons.include?(wagon) end

  private

  attr_accessor :answer, :second_answer

  def wait_any_input
    gets
    nil
  end

  def raise_error(error_message=nil)
    RailText.error(error_message)
    wait_any_input
    nil
  end

  def showing_items(item_title, items)
    RailText.showing(item_title, items)
    wait_any_input
  end

  def add_station!(station) stations << station end
  def add_route!(route) routes << route end
  def add_train!(train) trains << train end
  def add_wagon!(wagon) wagons << wagon end
end
