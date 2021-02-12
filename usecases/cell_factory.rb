require 'singleton'
require_relative '../entities/cell'
require_relative 'living_state'
require_relative 'dead_state'

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
