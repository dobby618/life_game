require 'observer'

class Game
  include Observable
  CONDITION_STATUS = :living

  attr_reader :field

  def initialize(field)
    @field = field
  end

  def step_up
    field.cells = 
      field.cells.map.with_index do |cell, index|
        around_cells = field.arround_cells(index)
        cell.step_up(count_living_cells(around_cells))
      end
    
    display
  end

  def display
    changed
    notify_observers(field)
  end

  private

  def count_living_cells(around_cells)
    around_cells.flatten.compact.count { |cell| cell.state == CONDITION_STATUS }
  end
end
