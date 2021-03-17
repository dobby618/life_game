require 'singleton'

class CharView
  include Singleton

  def update(game)
    puts "\e[H\e[2J" # terminal clear
    p 'Char View'
    game.cells.each_with_index do |cell, index|
      case cell.state
      when :living
        print '■'
      when :dead
        print '□'
      end

      # この辺、ドットを2回続けて描きたくないな。
      game.end_of_x?(index) ? print("\n") : print('')
    end
  end
end
