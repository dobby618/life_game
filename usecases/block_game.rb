require_relative '../entities/game'

class BlockGame < Game
  def initialize
    super(4, 4)

    @cells = [
      @factory.create('Dead'), @factory.create('Dead'),   @factory.create('Dead'),   @factory.create('Dead'),
      @factory.create('Dead'), @factory.create('Living'), @factory.create('Living'), @factory.create('Dead'),
      @factory.create('Dead'), @factory.create('Living'), @factory.create('Living'), @factory.create('Dead'),
      @factory.create('Dead'), @factory.create('Dead'),   @factory.create('Dead'),   @factory.create('Dead')
    ]
  end
end
