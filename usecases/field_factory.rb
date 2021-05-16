require_relative '../entities/cell_relation'
require_relative 'beacon_cell_collection'

class FieldFactory
  attr_reader :field

  def initialize(name)
    cell_collection = eval "#{name.to_s.capitalize}CellCollection.new"
    relation        = CellRelation.new(cell_collection.width, cell_collection.height)

    @field = Field.new(cell_collection, relation)
  end
end
