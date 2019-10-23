class Cell
  attr_reader :adjacent_cell_ids

  def initialize(adjacent_cell_ids)
    @adjacent_cell_ids = adjacent_cell_ids
  end
end