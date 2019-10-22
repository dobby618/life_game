require './lib/cell'

class LivingCell < Cell
  # @return [True]  生存
  # @return [False] 死滅
  def alive_in_next_generation?(adjacent_alive_cell_count)
    [2, 3].include?(adjacent_alive_cell_count) ? true : false
  end
end
