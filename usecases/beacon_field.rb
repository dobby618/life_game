require_relative '../entities/field'
require_relative '../entities/cell_factory'

class BeaconField < Field
  def height
    6
  end

  def width
    6
  end

  private

  def initialize_cells
    factory = CellFactory.instance
    @cells = 
      [
        factory.create(:dead), factory.create(:dead),   factory.create(:dead),   factory.create(:dead),   factory.create(:dead),   factory.create(:dead),
        factory.create(:dead), factory.create(:living), factory.create(:living), factory.create(:dead),   factory.create(:dead),   factory.create(:dead),
        factory.create(:dead), factory.create(:living), factory.create(:living), factory.create(:dead),   factory.create(:dead),   factory.create(:dead),
        factory.create(:dead), factory.create(:dead),   factory.create(:dead),   factory.create(:living), factory.create(:living), factory.create(:dead),
        factory.create(:dead), factory.create(:dead),   factory.create(:dead),   factory.create(:living), factory.create(:living), factory.create(:dead),
        factory.create(:dead), factory.create(:dead),   factory.create(:dead),   factory.create(:dead),   factory.create(:dead),   factory.create(:dead),
      ]
  end
end
