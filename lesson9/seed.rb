# frozen_string_literal: true

module Seed
  def seed
    s1 = Station.new('Station 1')
    s2 = Station.new('Station 2')
    s3 = Station.new('Station 3')
    s4 = Station.new('Station 4')
    s5 = Station.new('Station 5')

    r1 = Route.new(s1, s3)
    r1.add_station(s2)

    r2 = Route.new(s3, s5)
    r2.add_station(s4)

    t1 = TrainPass.new('pas-01')
    t2 = TrainPass.new('pas02')

    t3 = TrainCargo.new('car-01')
    t4 = TrainCargo.new('car02')

    w1 = WagonPass.new(100)
    w2 = WagonPass.new(100)
    w3 = WagonPass.new(150)
    w4 = WagonPass.new(150)

    w5 = WagonCargo.new(67)
    w6 = WagonCargo.new(67)
    w7 = WagonCargo.new(67)
    w8 = WagonCargo.new(67)

    t1.add_wagon(w1)
    t1.add_wagon(w2)
    t2.add_wagon(w3)
    t2.add_wagon(w4)
    t3.add_wagon(w5)
    t3.add_wagon(w6)
    t4.add_wagon(w7)
    t4.add_wagon(w8)

    t1.route = r1
    t2.route = r2
    t3.route = r1
    t4.route = r2

    t1.go_next_station
    t1.go_next_station
    t4.go_next_station

    5.times { w1.reserve_seat }
    10.times { w2.reserve_seat }
    20.times { w3.reserve_seat }
    50.times { w4.reserve_seat }

    { stations: [s1, s2, s3, s4, s5],
      routes: [r1, r2],
      trains: [t1, t2, t3, t4],
      wagons: [w1, w2, w3, w4, w5, w6, w7, w8] }
  end
end
