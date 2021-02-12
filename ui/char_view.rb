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

      (index % field.width) == (field.width - 1) ? print("\n") : print('')
    end
  end
end
