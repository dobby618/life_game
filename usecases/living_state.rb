require 'singleton'
require './usecases/dead_state'

class LivingState
  include Singleton

  # state interface
  def to_sym
    :living
  end

  # state interface
  def step_up(number)
    (number <= 1) || (4 <= number) ? DeadState.instance : self
  end
end
