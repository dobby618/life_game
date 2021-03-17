require_relative '../entities/game'

class BlockGame < Game
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
