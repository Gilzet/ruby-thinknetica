# frozen_string_literal: true

class Station
  include InstanceCounter
  include Validation
  extend Accessors

  @all = []

  class << self
    attr_reader :all
  end

  attr_reader :trains

  strong_attr_accessor :name, String

  validate :name, :presence
  validate :name, :type, String

  def initialize(name)
    @name = name
    @trains = []
    self.class.all << self
    validate!
    register_instance
  end

  def each_train(&block)
    trains.each_with_index(&block)
    nil
  end

  def show_trains(type = nil)
    return trains if type.nil?

    particular_trains(type)
  end

  def take_train(train)
    take_train!(train) if !trains.include?(train) && train.station == self
  end

  def send_train(train)
    send_train!(train) if trains.include?(train)
  end

  private

  def particular_trains(type)
    trains.select { |train| train.type == type }
  end

  def take_train!(train)
    trains << train
  end

  def send_train!(train)
    trains.delete(train)
  end
end
