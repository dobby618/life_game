require "./lib/cell"
require "./lib/dead_cell"

class LivingCell < Cell
  def living?
    true
  end

  def evolve(adjacent_living_cell_count)
    if living_or_dead_in_next_generation?(adjacent_living_cell_count)
      self
    else
      dead_cell(adjacent_cell_ids)
    end
  end

  # @return [True]  生存
  # @return [False] 死滅
  def living_or_dead_in_next_generation?(adjacent_living_cell_count)
    [2, 3].include?(adjacent_living_cell_count) ? true : false
  end

  private # もしかしたら、依存度の高いものをプライベートにするのか？

  def dead_cell(adjacent_cell_ids)
    DeadCell.new(adjacent_cell_ids)
  end
end
