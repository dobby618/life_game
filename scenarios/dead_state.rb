require 'singleton'
require './scenarios/living_state'

class DeadState
  include Singleton

  def to_sym
    :dead
  end

  def step_up(number)
    number == 3 ? LivingState.instance : self
  end
end
