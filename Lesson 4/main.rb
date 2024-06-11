# frozen_string_literal: true

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
      answer = gets.chomp.downcase
      case answer
      when "1", "s", "show" then show_menu
      when "2", "a", "add" then add_new_menu
      when "3", "l", "select" then select_menu
      when "0", "e", "exit" then break 0
      else RailText.error; answer = gets
      end
    end
  end

  def show_menu
    loop do
      RailText.show_menu
      answer = gets.chomp.downcase
      case answer
      when "1", "a", "all" then RailText.showing("All", info); self.answer = gets
      when "2", "s", "stations" then RailText.showing("Stations", stations); self.answer = gets
      when "3", "r", "routes" then RailText.showing("Routes", routes); self.answer = gets
      when "4", "t", "trains" then RailText.showing("Trains", trains); self.answer = gets
      when "5", "w", "wagons" then RailText.showing("Wagons", wagons); self.answer = gets
      when "0", "b", "back" then break 0
      else RailText.error; answer = gets; break 0
      end
    end
  end

  def add_new_menu
    loop do
      RailText.add_new_menu
      answer = gets.chomp.downcase
      case answer
      when "1", "s", "station" then add_new_station
      when "2", "r", "route" then add_new_route
      when "3", "t", "train" then add_new_train
      when "4", "w", "wagon" then add_new_wagon
      when "0", "b", "back" then break 0
      else RailText.error; answer = gets; break 0
      end
    end
  end

  def select_menu
    loop do
      RailText.select_menu
      answer = gets.chomp.downcase
      case answer
      when "1", "s", "station" then select_station
      when "2", "r", "route" then select_route
      when "3", "t", "train" then select_train
      when "4", "w", "wagon" then select_wagon
      when "0", "b", "back" then break 0
      else RailText.error; answer = gets; break 0
      end
    end
  end

  def add_new_station
    RailText.add_new_station_name
    answer = gets.chomp.capitalize
    add_station(Station.new(answer))
    RailText.after_add_new("station")
    answer = gets
  end

  def add_new_route
    RailText.add_new_route
    RailText.select_list_menu("Start station", stations)
    answer = gets.chomp.to_i; return if answer.zero? || answer.nil?
    RailText.select_list_menu("Last station", stations)
    second_answer = gets.chomp.to_i; return if second_answer.zero? || second_answer.nil?
    add_route(Route.new(stations[answer-1], stations[second_answer-1]))
    RailText.after_add_new("route"); answer = gets
  end

  def add_new_train
    RailText.add_new_train_number
    answer = gets.chomp.to_i; return if answer.zero? || answer.nil?
    RailText.add_new_train_type
    second_answer = gets.chomp.downcase
    case second_answer
    when "1", "c", "cargo" then add_train(TrainCargo.new(answer))
    when "2", "p", "passenger" then add_train(TrainPass.new(answer))
    when "0", "b", "back" then return
    else RailText.error; self.answer = gets; return
    end
    RailText.after_add_new("train"); answer = gets
  end

  def add_new_wagon
    RailText.add_new_wagon_type
    answer = gets.chomp.downcase
    case answer
    when "1", "c", "cargo" then add_wagon(WagonCargo.new)
    when "2", "p", "passenger" then add_wagon(WagonPass.new)
    when "0", "b", "back" then return
    else RailText.error; self.answer = gets; return
    end
    RailText.after_add_new("wagon"); answer = gets
  end

  def select_station
  end

  def select_route
  end

  def select_train
  end

  def select_wagon
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

  def add_station!(station) stations << station end
  def add_route!(route) routes << route end
  def add_train!(train) trains << train end
  def add_wagon!(wagon) wagons << wagon end
end

new_road = RailRoad.new
