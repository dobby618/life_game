require 'singleton'
require './entities/cell'
require './usecases/living_state'
require './usecases/dead_state'

class CellFactory
  include Singleton

  def create(status)
    case status.to_sym
    in :living
      Cell.new(LivingState.instance)
    in :dead
      Cell.new(DeadState.instance)
    end
  end
end