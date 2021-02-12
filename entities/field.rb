require 'observer'
require_relative '../usecases/cell_factory' # usecase に依存してるよ？

class Field
  include Observable
  attr_reader :width, :hight, :cells

  def initialize(width, hight, cells = [])
    @width = width
    @hight = hight
    @cells = cells
    @new_cells = []
    @factory = CellFactory.instance
  end

  def step_up
    cells.each_with_index do |cell, index|
      number = count_around(x_point_at(index), y_point_at(index))
      @new_cells << cell.step_up(number)
    end

    @cells = @new_cells
    @new_cells = []

    changed
    notify_observers(self)
  end

  private

  def coordinates(x_point, y_point)
    return nil if x_point.negative? || y_point.negative?
    return nil unless x_point.between?(0, width - 1)
    return nil unless y_point.between?(0, hight - 1)

    index = x_point * width + y_point
    cells[index]
  end

  def count_around(x_point, y_point)
    # ここってさぁ x, y にする必要ある？
    around_cells =
      (-1..1).map do |x|
        (-1..1).map do |y|
          next nil if x == 0 && y == 0
          # p "x_point + x:#{x_point + x}, y_point + y:#{y_point + y}"
          # p coordinates(x_point + x, y_point + y)
          coordinates(x_point + x, y_point + y)
        end
      end
    # ゲームとして正しい状態を持ちたい。:living の部分直書きじゃなくてメソッドか定数かにしたい
    # p "x:#{x_point}, y:#{y_point}, * #{around_cells.flatten.compact.count { |cell| cell.state == :living }}"
    around_cells.flatten.compact.count { |cell| cell.state == :living }
  end

  def x_point_at(index)
    index / width
  end

  def y_point_at(index)
    index % width
  end
end
