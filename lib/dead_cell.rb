require './lib/cell'
require './lib/alive_cell'

class DeadCell < Cell
  def evolve(adjacent_cell)
    adjacent_cell == 3 ? AliveCell.new : self
  end
end
