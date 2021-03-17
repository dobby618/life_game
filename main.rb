require_relative 'usecases/game_factory'
require_relative 'ui/char_view'

game = GameFactory.instance.create(:beacon)
game.add_observer(CharView.instance)

game.changed
game.notify_observers(game)

loop do
  game.step_up
  sleep 1
end
