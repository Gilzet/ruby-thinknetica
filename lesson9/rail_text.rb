# frozen_string_literal: true

module RailText
  def self.greeting
    puts 'Initialize program: railroad model'
  end

  def self.main_menu
    puts <<~TXT
      ============
       Main menu
      ============
      1. (S)how ..
      2. (A)dd new..
      3. Se(l)ect ..

      0. (E)xit
    TXT
  end

  def self.show_menu
    puts <<~TXT
      ============
       Show ..
      ============
      1. (A)ll
      2. (S)tations
      3. (R)outes
      4. (T)rains
      5. (W)agons

      0. (B)ack to main menu
    TXT
  end

  def self.add_new_menu
    puts <<~TXT
      ============
       Add new ..
      ============
      1. (S)tation
      2. (R)oute
      3. (T)rain
      4. (W)agon

      0. (B)ack to main menu
    TXT
  end

  def self.add_new_station_name
    puts <<~TXT
      ==================
       Add new station#{' '}
      ==================
      Enter station name (0 to cancel):#{' '}
    TXT
  end

  def self.add_new_route
    puts <<~TXT
      ==================
       Add new route
      ==================
    TXT
  end

  def self.add_new_train_number
    puts <<~TXT
      ==================
       Add new train
      ==================
      Enter train number (0 to cancel):
    TXT
  end

  def self.add_new_train_type
    puts <<~TXT
      ====================
       Select train type
      ====================
      1. (C)argo
      2. (P)assenger

      0. Cancel, (B)ack to main menu
    TXT
  end

  def self.add_new_wagon_type
    puts <<~TXT
      ====================
       Select wagon type
      ====================
      1. (C)argo
      2. (P)assenger

      0. Cancel, (B)ack to main menu
    TXT
  end

  def self.add_new_wagon_volume
    puts <<~TXT
      =====================
       Add new cargo wagon
      =====================
      Enter wagon volume:
    TXT
  end

  def self.add_new_wagon_seats
    puts <<~TXT
      =========================
       Add new passenger wagon
      =========================
      Enter number of seats:
    TXT
  end

  def self.select_menu
    puts <<~TXT
      ============
       Select ..
      ============
      1. (S)tation
      2. (R)oute
      3. (T)rain
      4. (W)agon

      0. (B)ack to main menu
    TXT
  end

  def self.station_menu(station)
    puts <<~TXT
      ====================
       Station menu #{station}
      ====================
      1. Show (A)ll trains
      2. Show (C)argo trains
      3. Show (P)assenger trains

      0. (B)ack
    TXT
  end

  def self.route_menu(route)
    puts <<~TXT
      ====================
       Route menu #{route}
      ====================
      1. (S)how stations
      2. (A)dd way station
      3. (R)emove way station

      0. (B)ack
    TXT
  end

  def self.train_menu(train)
    puts <<~TXT
      ====================
       Train menu #{train}
      ====================
      1. (S)how wagons
      2. Add (W)agon
      3. (R)emove wagon
      4. (A)ssign a route
      5. Go to (N)ext station
      6. Go to (P)revious station

      0. (B)ack
    TXT
  end

  def self.wagon_pass_menu(wagon)
    puts <<~TXT
      ====================
       Passenger wagon menu #{wagon}
      ====================
      1. Show (t)rain
      2. (R)eserve seat

      0. (B)ack
    TXT
  end

  def self.wagon_cargo_menu(wagon)
    puts <<~TXT
      ====================
       Cargo wagon menu #{wagon}
      ====================
      1. Show (t)rain
      2. (L)oad cargo

      0. (B)ack
    TXT
  end

  def self.load_volume(wagon)
    puts <<~TXT
      ====================
       Cargo wagon menu #{wagon}
      ====================
      Enter load volume:
    TXT
  end

  def self.select_list_menu(item_title, items)
    puts <<~TXT
      ==============================================
       Select #{item_title} number, starting from 1
      ==============================================

      #{items.empty? ? 'None' : items}

      0. (B)ack
    TXT
  end

  def self.showing(items_title, items)
    puts '============'
    puts items_title
    puts '============'
    puts items
    puts
    puts 'Back ->'
  end

  def self.success_delete(item_title)
    puts <<~TXT
      ====================
       #{item_title} removed
      ====================
      Back ->
    TXT
  end

  def self.success_add(item_title)
    puts <<~TXT
      ====================
       #{item_title} added
      ====================
      Back ->
    TXT
  end

  def self.success_add_new(item_title)
    puts <<~TXT
      ========================
       New #{item_title} added
      ========================
      Back ->
    TXT
  end

  def self.message(item_title)
    puts <<~TXT
      ========================
       #{item_title}
      ========================
      Back ->
    TXT
  end

  def self.error(error_message = nil)
    puts <<~TXT
      ======================
       #{error_message || 'Something went wrong'}
      ======================
      Back ->
    TXT
  end
end
