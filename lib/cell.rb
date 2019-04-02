class Cell
    attr_accessor :status
    attr_reader :living_cells

    def initialize(status: , living_cells: [])
        @status = status
        @living_cells = living_cells
    end

    def next_status(bord)
        count = @living_cells.inject(0) do |sum, cell|
            x, y = cell
            bord.get_status(x: x, y: y) ? sum + 1 : sum
        end
        
        new_status(living_cell_count: count)
    end
    
    def new_status(living_cell_count:)
        if @status
            return false if living_cell_count <= 1
            return true if [2, 3].include?(living_cell_count)
            false
        else
            living_cell_count == 3 ? true : false
        end
    end
end
