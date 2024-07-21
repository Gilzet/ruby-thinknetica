# frozen_string_literal: true

class TrainPass < Train
  PASS_TYPE = :pass

  def initialize(number)
    @type = PASS_TYPE
    super
  end
end
