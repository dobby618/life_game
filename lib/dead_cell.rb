require './lib/cell'

class DeadCell < Cell
  # @return [True]  生存
  # @return [False] 死滅
  def alive_in_next_generation?(adjacent_alive_cell_count)
    adjacent_alive_cell_count == 3 ? true : false
  end
end
