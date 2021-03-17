require_relative '../entities/game'

class BeaconGame < Game
  def initialize
    super(6, 6)

    @cells = [
      @factory.create(:dead), @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),
      @factory.create(:dead), @factory.create(:living), @factory.create(:living), @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),
      @factory.create(:dead), @factory.create(:living), @factory.create(:living), @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),
      @factory.create(:dead), @factory.create(:dead),   @factory.create(:dead),   @factory.create(:living), @factory.create(:living), @factory.create(:dead),
      @factory.create(:dead), @factory.create(:dead),   @factory.create(:dead),   @factory.create(:living), @factory.create(:living), @factory.create(:dead),
      @factory.create(:dead), @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),
    ]
  end
end
