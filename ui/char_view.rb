require 'singleton'

class CharView
  include Singleton

  def update(field)
    puts "\e[H\e[2J" # terminal clear
    p 'Char View'
    field.cells.each_with_index do |cell, index|
      case cell.state
      when :living
        print '■'
      when :dead
        print '□'
      end

      # この辺、ドットを2回続けて描きたくないな。
      field.relation.end_of_x?(index) ? print("\n") : print('')
    end
  end
end
