require './lib/cell'
require './lib/dead_cell'

class AliveCell < Cell
  def evolve(adjacent_cell)
    [2, 3].include?(adjacent_cell) ? self : DeadCell.new
  end
end
