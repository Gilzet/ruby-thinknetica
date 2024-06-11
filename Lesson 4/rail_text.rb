# frozen_string_literal: true

module RailText

  def self.greeting
    puts "Старт программы: модель железной дороги"
  end

  def self.main_menu
    puts "Main menu "
    puts ""
    puts "1. (S)how .."
    puts "2. (A)dd new.."
    puts "3. Se(l)ect .."
    puts ""
    puts "0. (E)xit"
  end

  def self.show_menu
    puts "Show .."
    puts ""
    puts "1. (A)ll"
    puts "2. (S)tations"
    puts "3. (R)outes"
    puts "4. (T)rains"
    puts "5. (W)agons"
    puts ""
    puts "0. (B)ack to main menu"
  end

  def self.add_new_menu
    puts "Add new .."
    puts ""
    puts "1. (S)tation"
    puts "2. (R)oute"
    puts "3. (T)rain"
    puts "4. (W)agon"
    puts ""
    puts "0. (B)ack to main menu"
  end

  def self.add_new_station_name
    puts "Add new station"
    puts ""
    print "Enter station name: "
  end

  def self.add_new_route
    puts "Add new route"
    puts ""
  end

  def self.add_new_train_number
    puts "Add new train"
    puts ""
    print "Enter train number: "
  end

  def self.add_new_train_type
    puts "Select train type"
    puts ""
    puts "1. (C)argo"
    puts "2. (P)assenger"
    puts ""
    puts "0. Cancel, back to main menu"
  end

  def self.add_new_wagon_type
    puts "Select wagon type"
    puts ""
    puts "1. (C)argo"
    puts "2. (P)assenger"
    puts ""
    puts "0. Cancel, back to main menu"
  end

  def self.select_menu
    puts "Select .."
    puts ""
    puts "1. (S)tation"
    puts "2. (R)oute"
    puts "3. (T)rain"
    puts "4. (W)agon"
    puts ""
    puts "0. (B)ack to main menu"
  end

  def self.station_menu(station)
    puts "Station menu #{station}"
    puts ""
    puts "1. Show (A)ll trains"
    puts "2. Show (C)argo trains"
    puts "3. Show (P)assenger trains"
    puts ""
    puts "0. (B)ack"
  end

  def self.route_menu(route)
    puts "Route menu #{route}"
    puts ""
    puts "1. (S)how stations"
    puts "2. (A)dd way station"
    puts "3. (R)emove way station"
    puts ""
    puts "0. (B)ack"
  end

  def self.train_menu(train)
    puts "Train menu #{train}"
    puts ""
    puts "1. (S)how wagons"
    puts "2. Add (W)agon"
    puts "3. (R)emove wagon"
    puts "4. (A)ssign a route"
    puts "5. Go to (N)ext station"
    puts "5. Go to (P)revious station"
    puts ""
    puts "0. (B)ack"
  end

  def self.wagon_menu(wagon)
    puts "Wagon menu #{wagon}"
    puts ""
    puts "1. Show (T)ype"
    puts "2. (S)how train"
    puts ""
    puts "0. (B)ack"
  end

  def self.select_list_menu(item_title, items)
    puts "Select #{item_title} number, starting from 1"
    puts ""
    puts "#{items}"
    puts ""
    puts "0. (B)ack"
  end

  def self.showing(items_title, items)
    puts "#{items_title}"
    puts ""
    puts "#{items}"
    puts ""
    puts "0. (B)ack"
  end

  def self.after_delete(item_title)
    puts "#{item_title} removed"
    puts ""
    print "Back to main menu: "
  end

  def self.after_add(item_title)
    puts "#{item_title} added"
    puts ""
    print "Back to main menu: "
  end

  def self.after_add_new(item_title)
    puts "New #{item_title} added"
    puts ""
    print "Back to main menu: "
  end

  def self.error
    puts "Something went wrong"
    puts ""
    print "Back to main menu: "
  end
end
