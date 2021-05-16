class Field
  attr_reader :relation

  def initialize(cell_collection, cell_relation)
    @cell_collection = cell_collection
    @relation = cell_relation
  end

  def cells
    @cell_collection.cells
  end

  def cells=(cells)
    @cell_collection.cells = cells
    @cell_collection.cells
  end
end
