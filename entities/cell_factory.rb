require 'singleton'
require_relative '../entities/cell'
require_relative 'living_state'
require_relative 'dead_state'

class CellFactory
  include Singleton

  def create(type)
    eval "Cell.new(#{type.to_s.capitalize}State.instance)"
  end
end
