require "./lib/dead_cell"
require "./lib/living_cell"

class Field
  # 進化
  def evolve(cell, adjacent_alive_cell_count)
    if cell.alive_in_next_generation?(adjacent_alive_cell_count)
      living_cell
    else
      dead_cell
    end
  end

  private

  def living_cell
    LivingCell.new
  end

  def dead_cell
    DeadCell.new
  end
end