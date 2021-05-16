require_relative 'ui/char_view'
require_relative 'usecases/field_factory'
require_relative 'entities/game'
require_relative 'entities/field'

factory = FieldFactory.new(:beacon)
game = Game.new(factory.field)

game.add_observer(CharView.instance)
game.display

loop do
  game.step_up
  sleep 1
end
