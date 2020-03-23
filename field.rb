# frozen_string_literal: true
require './cell'

class Field
  def initialize
    @field = to_field
  end

  def count_lines
    @field.size
  end

  def count_columns
    @field.first.size
  end

  private

  def to_field
    cells.map do |row|
      row.map do |status|
        Cell.new(alive: status)
      end
    end
  end
end
