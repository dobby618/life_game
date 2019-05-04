require "life_process"
require "living_cell"

class DeadCellLifeProcess < LifeProcess
    def to_next_generation(cell)
        return cell if cell.status || number_of_living_cells_around != 3
        
        LivingCell.new
    end
end