require 'observer'

class Game
  include Observable
  CONDITION_STATUS = :living

  def initialize(field)
    @field = field
    @cells = field.cells
  end

  def cells=(cells)
    @field.cells = cells
    @cells = cells
  end

  def step_up
    self.cells = 
      @cells.map.with_index do |cell, index|
        around_cells = @field.relation.arround_cells(@cells, index)
        cell.step_up(count_living_cells(around_cells))
      end
    
    display
  end

  def display
    changed
    notify_observers(@field)
  end

  private

  def count_living_cells(around_cells)
    around_cells.flatten.compact.count { |cell| cell.state == CONDITION_STATUS }
  end
end
