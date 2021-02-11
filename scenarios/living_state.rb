require 'singleton'
require './scenarios/dead_state'

class LivingState
  include Singleton

  def to_sym
    :living
  end

  def step_up(number)
    (number <= 1) || (4 <= number) ? DeadState.instance : self
  end
end
