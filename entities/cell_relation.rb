# Value オブジェクトである。

class CellRelation
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end
  # そもそも位置情報をどうやって持たせるのか？考えたい。unless で計算したくないよね。

  def arround_cells(cells, index)
    base_x_point = x_point_at(index)
    base_y_point = y_point_at(index)

    # ここってさぁ x, y にする必要ある？
    (-1..1).map do |x| # 周辺を見てるってことだよなぁ
      (-1..1).map do |y|
        next nil if x == 0 && y == 0

        x_point = base_x_point + x
        y_point = base_y_point + y

        if valid_coordinates?(x_point + x, y_point + y)
          index = x_point * width + y_point # ここをメソッドにしたい。
          cells[index]
        else
          nil
        end
      end
    end
  end

  # x座標の終点かどうかを判定する
  def end_of_x?(index)
    (index % width) == (width - 1)
  end

  # 縦横のサイズで比較する
  def equal?(other)
    width == other.width && height == other.height
  end
  alias_method :==, :equal?

  private

  def x_point_at(index)
    index / width
  end

  def y_point_at(index)
    index % width
  end

  def valid_coordinates?(x_point, y_point)
    return false if x_point.negative? || y_point.negative?
    return false unless x_point.between?(0, width - 1)
    return false unless y_point.between?(0, height - 1)

    true
  end
end
