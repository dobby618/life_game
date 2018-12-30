class Filed
end

class SquareFiled < Filed
    attr_accessor :cells #配列で持つ
    attr_accessor :number_of_cells_on_one_side
    attr_accessor :drawing
    
    def initialize(number_of_cells_on_one_side)
        @number_of_cells_on_one_side = number_of_cells_on_one_side
        @cells = Array.new(number_of_cells_on_one_side ** 2 - 1)
        @drawing = Drawing.new
    end
    
    def initialize_cells(cells)
        @cells = cells
        set_adjacent_cell
    end
    
    def next_generate
        next_cells
        set_adjacent_cell
    end
    
    def print(method = :cui)
        @drawing.cells = @cells
        if method == :cui
            @drawing.print_cui
        end
    end
    
    private
    
    def next_cells
        @cells = @cells.map.with_index do |cell, i|
            cell.next
        end
    end
    
    def set_adjacent_cell
        # 隣接するセルを追加
        (0...number_of_cells_on_one_side).each do |h|
            (0...number_of_cells_on_one_side).each do |w|
                self_index = (h * number_of_cells_on_one_side) + w
                adjacent_cell_indexs = 
                    %W(#{self_index - number_of_cells_on_one_side - 1}
                       #{self_index - number_of_cells_on_one_side}
                       #{self_index - number_of_cells_on_one_side + 1}
                       #{self_index - 1}
                       #{self_index + 1}
                       #{self_index + number_of_cells_on_one_side - 1}
                       #{self_index + number_of_cells_on_one_side}
                       #{self_index + number_of_cells_on_one_side + 1})
                adjacent_cell_indexs.map!{|i| i.to_i}

                adjacent_cell_indexs.select!{|i| i >= 0}
                adjacent_cell_indexs.select!{|i| i < (number_of_cells_on_one_side ** 2)}
                if self_index % number_of_cells_on_one_side == 0
                    adjacent_cell_indexs.select! {|i| i != (self_index - number_of_cells_on_one_side - 1) }
                    adjacent_cell_indexs.select! {|i| i != (self_index - 1) }
                    adjacent_cell_indexs.select! {|i| i != (self_index + number_of_cells_on_one_side - 1) }
                end
                if self_index % number_of_cells_on_one_side == 4
                    adjacent_cell_indexs.select! {|i| i != (self_index - number_of_cells_on_one_side + 1) }
                    adjacent_cell_indexs.select! {|i| i != (self_index + 1) }
                    adjacent_cell_indexs.select! {|i| i != (self_index + number_of_cells_on_one_side + 1) }
                end
                
                @cells[self_index].adjacent_cells = @cells.values_at(*adjacent_cell_indexs)
            end
        end
    end
end

