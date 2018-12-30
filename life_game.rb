require "./cell"
require "./field"
require "./drawing"

# 初期化
# ブリンカー
cells = []
cells[0] = DeadCell.new
cells[1] = DeadCell.new
cells[2] = DeadCell.new
cells[3] = DeadCell.new
cells[4] = DeadCell.new(crlf: true)

cells[5] = DeadCell.new
cells[6] = DeadCell.new
cells[7] = AliveCell.new
cells[8] = DeadCell.new
cells[9] = DeadCell.new(crlf: true)

cells[10] = DeadCell.new
cells[11] = DeadCell.new
cells[12] = AliveCell.new
cells[13] = DeadCell.new
cells[14] = DeadCell.new(crlf: true)

cells[15] = DeadCell.new
cells[16] = DeadCell.new
cells[17] = AliveCell.new
cells[18] = DeadCell.new
cells[19] = DeadCell.new(crlf: true)

cells[20] = DeadCell.new
cells[21] = DeadCell.new
cells[22] = DeadCell.new
cells[23] = DeadCell.new
cells[24] = DeadCell.new(crlf: true)

field = SquareFiled.new(5)
field.initialize_cells(cells)
field.print

3.times do
    field.next_generate
    field.print
end
