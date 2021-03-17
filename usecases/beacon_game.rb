require_relative '../entities/game'

class BeaconGame < Game
  def height
    6
  end

  def width
    6
  end

  def initialize_cells(factory)
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
