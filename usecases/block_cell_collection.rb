require_relative '../entities/cell_collection'

class BlockCellCollection < CellCollection
  def height
    4
  end

  def width
    4
  end

  def initialize_cells(factory)
    [
      factory.create('Dead'), factory.create('Dead'),   factory.create('Dead'),   factory.create('Dead'),
      factory.create('Dead'), factory.create('Living'), factory.create('Living'), factory.create('Dead'),
      factory.create('Dead'), factory.create('Living'), factory.create('Living'), factory.create('Dead'),
      factory.create('Dead'), factory.create('Dead'),   factory.create('Dead'),   factory.create('Dead')
    ]
  end
end
