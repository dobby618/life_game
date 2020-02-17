class Cell
  def initialize(alive:)
    @alive = alive
  end

  def alive?
    @alive
  end

  def dead?
    !@alive
  end

  def evolve!(living_cells_count)
    if @alive
      @alive = false if living_cells_count <= 1 || 4 <= living_cells_count
    else
      @alive = true if living_cells_count == 3
    end
  end
end