# Value オブジェクトである。

class Field
  class IllegalArgumentException < StandardError; end

  attr_reader :width, :height

  def initialize(width, height)
    raise IllegalArgumentException if width <= 0 || height <= 0 # 完全コンストラクターパターン

    @width = width
    @height = height
  end

  def x_point_at(index)
    index / width
  end

  def y_point_at(index)
    index % width
  end

  # 状態で比較する。
  def equal?(other)
    width == other.width && height == other.height
  end
  alias_method :==, :equal?
end
