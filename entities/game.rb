require 'observer'
require_relative 'cell_factory' # usecase に依存してるよ？
require_relative 'field'

class Game
  include Observable

  attr_reader :cells

  def initialize(width, height, cells = [])
    @field = Field.new(width, height)
    @cells = cells
    @factory = CellFactory.instance
  end

  def step_up
    @cells = create_new_cells

    changed
    notify_observers(self)
  end

  # x座標の終点かどうかを判定する
  def end_of_x?(index)
    (index % @field.width) == (@field.width - 1)
  end

  private

  def create_new_cells
    @cells.map.with_index do |cell, index|
      number = count_around(@field.x_point_at(index), @field.y_point_at(index))
      cell.step_up(number)
    end
  end

  def coordinates(x_point, y_point)
    return nil if x_point.negative? || y_point.negative?
    return nil unless x_point.between?(0, @field.width - 1)
    return nil unless y_point.between?(0, @field.height - 1)

    index = x_point * @field.width + y_point
    @cells[index]
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
end
