=begin
- セルは生死の状態を持つ
- セルの次のステップ（世代）の状態は、現在の状態と特定の数字を元に決定される

Entity とシナリオの境目をどこで区切るか考えた時に
いま思い付く「仕様の変更可能性がありそうなもの」を変更したときに変わらないものを Entity に持ってくることにした。
すなわち、変更可能性がありそうなものはシナリオとみなしてる。
=end
class Cell
  def initialize(state)
    @state = state
  end

  def state
    @state.to_sym
  end

  def step_up(number)
    @state = @state.step_up(number)
  end
end
