# frozen_string_literal: true

require './field'

class GraiderField < Field
  private

  def cells
    [
      [true, true, true],
      [true, false, false],
      [false, true, false]
    ]
  end
end
