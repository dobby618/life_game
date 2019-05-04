require "spec_helper"
require "./lib/dead_cell_life_process"
require "./lib/dead_cell"

describe "DeadCellLifeProcess" do
    let(:dead_cell)  { DeadCell.new }
    let(:dead_cell_life_process) { DeadCellLifeProcess.new(number_of_living_cells_around) }
    
    describe "セルが死んでいるとき" do
        context "隣接するセルがちょうど３のとき" do
            let(:number_of_living_cells_around) { 3 }

            it "次世代でセルが生まれる（生きてるセルに変わる）こと" do
                cell = dead_cell_life_process.to_next_generation(dead_cell)
                expect(cell.status).to eq true
            end
        end
        
        [0, 1, 2, 4, 5, 6, 7, 8].each do |i|
            context "隣接するセルが３つ以外（#{i}）のとき" do
                let(:number_of_living_cells_around) { i }
    
                it "次世代でセルは変わらず死んだままであること" do
                    cell = dead_cell_life_process.to_next_generation(dead_cell)
                    expect(cell.status).to eq false
                end
            end
        end
    end
end