# frozen_string_literal: true

module RailText

  def self.greeting
    puts "Initialize program: railroad model"
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
       Add new station
      ==================
      Enter station name: 
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
      Enter train number: 
    TXT
  end

  def self.add_new_train_type
    puts <<~TXT
      ====================
       Select train type
      ====================
      1. (C)argo
      2. (P)assenger
    
      0. Cancel, back to main menu
    TXT
  end

  def self.add_new_wagon_type
    puts <<~TXT
      ====================
       Select wagon type
      ====================
      1. (C)argo
      2. (P)assenger
      
      0. Cancel, back to main menu
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
      
      0. (B)ack"
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
      5. Go to (P)revious station
      
      0. (B)ack"
    TXT
  end

  def self.wagon_menu(wagon)
    puts <<~TXT
      ====================
       Wagon menu #{wagon}
      ====================
      1. Show (T)ype
      2. (S)how train
      
      0. (B)ack
    TXT
  end

  def self.select_list_menu(item_title, items)
    puts <<~TXT
      ==============================================
       Select #{item_title} number, starting from 1
      ==============================================
      
      #{items}
      
      0. (B)ack
    TXT
  end

  def self.showing(items_title, items)
    puts <<~TXT
      ============
       #{items_title}
      ============
      #{items}
      
      Back ->
    TXT
  end

  def self.after_delete(item_title)
    puts <<~TXT
      ====================
       #{item_title} removed
      ====================
      Back to main menu ->
    TXT
  end

  def self.after_add(item_title)
    puts <<~TXT
      ====================
       #{item_title} added
      ====================
      Back to main menu ->
    TXT
  end

  def self.after_add_new(item_title)
    puts <<~TXT
      ========================
       New #{item_title} added
      ========================
      Back to main menu ->
    TXT
  end

  def self.error
    puts <<~TXT
    ======================
     Something went wrong
    ======================
    Back to main menu ->
    TXT
  end
end
