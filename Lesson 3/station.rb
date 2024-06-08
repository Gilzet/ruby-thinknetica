# frozen_string_literal: true

class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def trains(type=nil)
    if type.nil?
      @trains
    else
      @trains.select{|train| train.type == type}
    end
  end

  def take_train(train)
    @trains << train unless @trains.include?(train)
  end

  def send_train
    @trains.pop unless @trains.empty?
  end
end
