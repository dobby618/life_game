require_relative '../entities/cell_factory'

class CellCollection
  attr_writer :cells

  def initialize
    @factory = CellFactory.instance
  end

  def cells
    initialize_cells unless defined? @cells
    @cells
  end

  def initialize_cells
    raise "メソッドをサブクラスで実装してください"
  end
end
