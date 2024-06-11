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
      when "1", "s" # show
        loop do
          RailText.show_menu
          self.answer = gets.chomp.downcase
          case answer
          when "1", "a" # show all
            puts info
            self.answer = gets
          when "2", "s" # show stations
            puts stations
            self.answer = gets
          when "3", "r" # show routes
            puts routes
            self.answer = gets
          when "4", "t" # show trains
            puts trains
            self.answer = gets
          when "5", "w" # show wagons
            puts wagons
            self.answer = gets
          when "0", "b" then break 0 # go back
          else
            RailText.error
            self.answer = gets
            break 0
          end
        end
      when "2", "a"
        loop do
          RailText.add_new_menu
          self.answer = gets.chomp.downcase
          case answer
          when "1", "s" then "add new station"
          when "2", "r" then "add new route"
          when "3", "t" then "add new train"
          when "4", "w" then "add new wagon"
          when "0", "b" then break 0
          else
            RailText.error
            self.answer = gets.chomp.downcase
            break 0
          end
        end
      when "3", "l"
        loop do
          RailText.select_menu
          self.answer = gets.chomp.downcase
          case answer
          when "1", "s" then "select station"
          when "2", "r" then "select route"
          when "3", "t" then "select train"
          when "4", "w" then "select wagon"
          when "0", "b" then break 0
          else
            RailText.error
            self.answer = gets.chomp.downcase
            break 0
          end
        end
      when "0", "e" then break 0
      else
        RailText.error
        self.answer = gets.chomp.downcase
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
