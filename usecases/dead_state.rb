require 'singleton'
require './usecases/living_state'

class DeadState
  include Singleton

  # state interface
  def to_sym
    :dead
  end

  # state interface
  def step_up(number)
    number == 3 ? LivingState.instance : self
  end
end
