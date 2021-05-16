require_relative '../entities/cell_collection'

class BeaconCellCollection < CellCollection
  def height
    6
  end

  def width
    6
  end

  private

  def initialize_cells
    @cells = 
      [
        @factory.create(:dead), @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),
        @factory.create(:dead), @factory.create(:living), @factory.create(:living), @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),
        @factory.create(:dead), @factory.create(:living), @factory.create(:living), @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),
        @factory.create(:dead), @factory.create(:dead),   @factory.create(:dead),   @factory.create(:living), @factory.create(:living), @factory.create(:dead),
        @factory.create(:dead), @factory.create(:dead),   @factory.create(:dead),   @factory.create(:living), @factory.create(:living), @factory.create(:dead),
        @factory.create(:dead), @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),
      ]
  end
end
