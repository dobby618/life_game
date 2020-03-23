# frozen_string_literal: true

require './graider_field'

describe 'Field' do
  describe 'グライダーの場合' do
    describe '格子の行数と列数を持つ' do
      let(:field) { GraiderField.new }

      it '格子の横幅は 3 であること' do
        expect(field.count_lines).to eq 3
      end

      it '格子の高さ 3 であること' do
        expect(field.count_columns).to eq 3
      end
    end

    # こういうメソッドが欲しいというメモ
    # describe 'セルの位置は行と列で指定できる' do
    #   context '行が 1、セルが 2 の場合' do
    #     field.cell(line: 1, column: 2)
    #     field.update_cell(line: 1, column: 2, alive: true)

    #     field.neighbors(line: 1, column: 2) # => [cell, cell, cell]
    #     field.ringin_statues(line: 1, column: 2) # => [true, false, true]
    #     field.count_alive_among_neighbors(line: 1, column: 2) # => 2
    #   end
    # end
  end
end
