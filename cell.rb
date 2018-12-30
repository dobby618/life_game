class Cell
    # status 自分は生きてるの？死んでるの？
    # :alive, :dead
    attr_accessor :status
    attr_accessor :adjacent_cells #周りのセル、配列で持つ
    attr_accessor :crlf
    
    def initialize
        @adjacent_cells = []
    end
    
    # 自分の周りの生きてるセルを数える
    def count_adjacent_alive_cells
        @adjacent_cells.select {|cell| cell.status == :alive }.count
    end
end

# 生きてるセル
class AliveCell < Cell
    def initialize(crlf: false)
        @crlf = crlf
        @status = :alive
    end
    
    def next
        new_cell = self
        if count_adjacent_alive_cells == 2 || count_adjacent_alive_cells == 3
            return new_cell
        end

        new_cell = DeadCell.new(crlf: self.crlf)
        new_cell.adjacent_cells = self.adjacent_cells
        return new_cell
    end
end

# 死んでいるセル
class DeadCell < Cell
    def initialize(crlf: false)
        @crlf = crlf
        @status = :dead
    end

    def next
        new_cell = self
        if count_adjacent_alive_cells == 3
            new_cell = AliveCell.new(crlf: self.crlf)
            new_cell.adjacent_cells = self.adjacent_cells
        end
        return new_cell
    end
end

