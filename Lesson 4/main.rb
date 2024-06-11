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
      self.answer = gets.chomp.downcase
      case answer
      when "1", "s", "show" then show_menu
      when "2", "a", "add" then add_new_menu
      when "3", "l", "select" then select_menu
      when "0", "e", "exit" then break 0
      else RailText.error; self.answer = gets
      end
    end
  end

  def show_menu
    loop do
      RailText.show_menu
      self.answer = gets.chomp.downcase
      case answer
      when "1", "a", "all" then RailText.showing("All", info); self.answer = gets
      when "2", "s", "stations" then RailText.showing("Stations", stations); self.answer = gets
      when "3", "r", "routes" then RailText.showing("Routes", routes); self.answer = gets
      when "4", "t", "trains" then RailText.showing("Trains", trains); self.answer = gets
      when "5", "w", "wagons" then RailText.showing("Wagons", wagons); self.answer = gets
      when "0", "b", "back" then break 0
      else RailText.error; self.answer = gets; break 0
      end
    end
  end

  def add_new_menu
    loop do
      RailText.add_new_menu
      self.answer = gets.chomp.downcase
      case answer
      when "1", "s", "station" then "add new station"
      when "2", "r", "route" then "add new route"
      when "3", "t", "train" then "add new train"
      when "4", "w", "wagon" then "add new wagon"
      when "0", "b", "back" then break 0
      else RailText.error; self.answer = gets; break 0
      end
    end
  end

  def select_menu
    loop do
      RailText.select_menu
      self.answer = gets.chomp.downcase
      case answer
      when "1", "s", "station" then "select station"
      when "2", "r", "route" then "select route"
      when "3", "t", "train" then "select train"
      when "4", "w", "wagon" then "select wagon"
      when "0", "b", "back" then break 0
      else RailText.error; self.answer = gets; break 0
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

  attr_accessor :answer

  def add_station!(station) stations << station end
  def add_route!(route) routes << route end
  def add_train!(train) trains << train end
  def add_wagon!(wagon) wagons << wagon end
end

new_road = RailRoad.new
