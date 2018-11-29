require "./cell"
class Map
    attr_accessor :cells
    
    def initialize(length = 3)
        @length = length
        @cells = Array.new(length) { Array.new(length) { DeadCell.new }}
    end
        
    # 近隣セルを生死ステータスを、各セルにセットする
    def set_neighboring_cells
        @cells.each_with_index do |line, row|
            line.each_with_index do |_, col|
                @cells[row][col].status_of_cells_around = set_status_of_cells_around(row, col)
            end
        end
    end
    
    # 周りのセルのステータスを保持した配列を作る
    def set_status_of_cells_around(row, col)
        array = Array.new
        
        for row_step in -1..1
            for col_step in -1..1
                next if row_step == 0 and col_step == 0
                array.push(cells_status(row + row_step, col + col_step))
            end
        end
        
        array
    end

    # セルの状態を返す
    def cells_status(row, col)
        return @cells[row][col].status if effective_range?(row, col)
        nil
    end

    # 列・行の値が有効か判定
    def effective_range?(row, col)
        return false if row < 0 or row >= @length
        return false if col < 0 or col >= @length
        true
    end

    # 次世代にステータスを変更する
    def change_status_to_next_generation
        @cells.each_with_index do |line, row|
            line.each_with_index do |_, col|
                @cells[row][col] = if @cells[row][col].life_and_death_rule(@cells[row][col].count_living_cells_around_me)
                                        LivingCell.new
                                    else
                                        DeadCell.new
                                    end
            end
        end
        set_neighboring_cells
    end
    
    # 今のステータスを■・□で表示す
    def print_all_status
        @cells.each_with_index do |line, row|
            line.each_with_index do |_, col|
                @cells[row][col].print_status
            end
            print "\n"
        end 
    end
end
