require "./cell"
class Map
    attr_accessor :cells
    
    def initialize(length = 3)
        @length = length
        
        @cells = Array
        length.times do |row|
            length.times do |col|
                @cells.push(DeadCell(row, col))
            end
        end
    end

    
    def set_living_cell(row, col)
        @cells
        # @cells.find
        # @cells.update_cell_to_living(row, col)
    end    

   
    def all
        # 全てのセル情報を返す？
    end
    
    def find_cell(row, col)
        # 指定したセルを返す
    end
    
    # セルを生きてるに変更する
    def update_cell_to_living(row, col)
        # もし既に生きてたら、falseを返そう
        # 変更できたらtrueを返す
    end

    # セルを死んでるに変更する
    def update_cell_to_death(row, col)
    end
    
    
        
    # 近隣セルを生死ステータスを、各セルにセットする
    def set_neighboring_cells
        @cells.each_with_index do |line, row|
            line.each_with_index do |_, col|
                @cells[row][col].status_of_cells_around = set_status_of_cells_around(row, col)
            end
        end
    end

    
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
    
    def cells_status(row, col)
        return @cells[row][col].status if effective_range?(row, col)
        nil
    end
    
    def effective_range?(row, col)
        return false if row < 0 or row >= @length
        return false if col < 0 or col >= @length
        true
    end
    
    private

    # 初期化時に、全て同じ値にするときに使う
    def default_cell(row, col)
        set_dead_cell(row, col)
    end    
    

    
    def print_all_status
        @cells.each_with_index do |line, row|
            line.each_with_index do |_, col|
                @cells[row][col].print_status
            end
            print "\n"
        end 
    end

    
    private
    
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
end

def Row
end