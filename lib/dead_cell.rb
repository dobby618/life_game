require './lib/cell'

class DeadCell < Cell
  def living?
    false
  end

  def evolve(adjacent_living_cell_count)
    if living_or_dead_in_next_generation?(adjacent_living_cell_count)
      living_cell(adjacent_cell_ids)
    else
      self
    end
  end

  # @return [True]  生存
  # @return [False] 死滅
  def living_or_dead_in_next_generation?(adjacent_alive_cell_count)
    adjacent_alive_cell_count == 3 ? true : false
  end

  private

  def living_cell(adjacent_cell_ids)
    LivingCell.new(adjacent_cell_ids)
  end
end
