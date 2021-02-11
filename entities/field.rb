require "observer"

class Field
  include Observable
  attr_reader :width, :cells

  def initialize(width, hight, cells)
    @width = width
    @hight = hight
    @cells = cells
  end

  def coordinates(x, y)
    index = x * width + y
    cells[index]
  end

  def step_up
    cells.each do |cell|
      number = rand(4) # きちんと正しい値を取得したい。
      cell.step_up(number)
    end

    changed
    notify_observers(self)
  end
end
