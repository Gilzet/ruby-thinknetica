# frozen_string_literal: true

class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def show_trains(type=nil)
    type.nil? ? trains : particular_trains(type)
  end

  def take_train(train)
    take_train!(train) if !trains.include?(train) && train.station == self
  end

  def send_train(train)
    send_train!(train) if trains.include?(train)
  end

  private

  def particular_trains(type)
    self.trains.select{|train| train.type == type}
  end

  def take_train!(train)
    trains << train
  end

  def send_train!(train)
    trains.delete(train)
  end
end
