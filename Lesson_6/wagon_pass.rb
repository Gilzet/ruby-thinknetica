# frozen_string_literal: true

class WagonPass < Wagon
  PASS_TYPE = :pass

  def initialize
    @type = PASS_TYPE
    super
  end
end
