require_relative 'ui/char_view'
require_relative 'usecases/field_factory'
require_relative 'entities/game'

field = FieldFactory.instance.create(:beacon)
game = Game.new(field)

game.add_observer(CharView.instance)
game.display

loop do
  game.step_up
  sleep 1
end
