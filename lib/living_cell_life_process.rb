require "life_process"
require "dead_cell"

class LivingCellLifeProcess < LifeProcess
    def to_next_generation(cell)
        return cell if !cell.status
        return cell if [2, 3].include?(number_of_living_cells_around)
        
        DeadCell.new
    end
end