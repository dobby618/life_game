require "./lib/dead_cell"
require "./lib/living_cell"

class Field
  def initialize(cells)
    @cells = cells
  end

  def evolve
    cells.map do |cell|
      cell.evolve(
        count_living_cell_around(cell)
      )
    end
  end

  # @return [Integer] 隣接する生きてるセルの数
  def count_living_cell_around(cell)
    cell.adjacent_cell_ids.map do |id|
      cells[id] if cells[id].living?
    end.compact!.count
  end
end