# frozen_string_literal: true

class TrainPass < Train
  PASS_TYPE = :pass

  def initialize(number)
    super
    @type = PASS_TYPE
  end

  def add_wagon(wagon)
    super if wagon.type == PASS_TYPE
  end
end
