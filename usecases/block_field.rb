require './entities/field'

class BlockField < Field
  def initialize
    super(4, 4)

    @cells = [
      @factory.create(:dead), @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead),
      @factory.create(:dead), @factory.create(:living), @factory.create(:living), @factory.create(:dead),
      @factory.create(:dead), @factory.create(:living), @factory.create(:living), @factory.create(:dead),
      @factory.create(:dead), @factory.create(:dead),   @factory.create(:dead),   @factory.create(:dead)
    ]
  end
end
