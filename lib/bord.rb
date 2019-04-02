require "./lib/cell"

class Bord
    def initialize(height: , width: )
        @bord = Array.new(width) { Array.new(height) { Cell.new(status: false) }}
    end

    def set(x:, y:, status:)
        @bord[x][y].status = status
    end
    
    def get_status(x:, y:)
        @bord[x][y].status
    end
    
    def next
        @bord =
            @bord.map.with_index do |row, i|
                row.map.with_index do |col, j|
                    Cell.new(status: @bord[i][j].next_status(self),
                             living_cells: @bord[i][j].living_cells)
                end
            end
    end
end

class Glider < Bord
    def initialize
        super(height: 3, width: 3)
        
        @bord[0][0] = Cell.new(status: true,  living_cells: [[0, 1], [1, 0], [1, 1]])
        @bord[0][1] = Cell.new(status: true,  living_cells: [[0, 0], [0, 2], [1, 0], [1, 1], [1, 2]])
        @bord[0][2] = Cell.new(status: true,  living_cells: [[0, 1], [1, 1], [1, 2]])

        @bord[1][0] = Cell.new(status: true,  living_cells: [[0, 0], [0, 1], [1, 1], [2, 0], [2, 1]])
        @bord[1][1] = Cell.new(status: false, living_cells: [[0, 0], [0, 1], [0, 2], [1, 0], [1, 2], [2, 0], [2, 1], [2, 2]])
        @bord[1][2] = Cell.new(status: false, living_cells: [[0, 1], [0, 2], [1, 1], [2, 1], [2, 2]])

        @bord[2][0] = Cell.new(status: false, living_cells: [[1, 0], [1, 1], [2, 1]])
        @bord[2][1] = Cell.new(status: true,  living_cells: [[1, 0], [1, 1], [1, 2], [2, 0], [2, 2]])
        @bord[2][2] = Cell.new(status: false, living_cells: [[1, 1], [1, 2], [2, 1]])
    end
end