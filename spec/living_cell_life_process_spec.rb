require "spec_helper"
require "./lib/living_cell_life_process"
require "./lib/living_cell"

describe "LivingCellLifeProcess" do
    let(:living_cell)  { LivingCell.new }
    let(:living_cell_life_process) { LivingCellLifeProcess.new(number_of_living_cells_around) }

    describe "セルが生きているとき" do
        [2, 3].each do |i|
            context "隣接するセルがちょうど#{i}のとき" do
                let(:number_of_living_cells_around) { i }
    
                it "次世代でもセルが生存する（生きた状態であること）こと" do
                    cell = living_cell_life_process.to_next_generation(living_cell)
                    expect(cell.status).to eq true
                end
            end
        end
        
        [0, 1, 4, 5, 6, 7, 8].each do |i|
            context "隣接するセルが３つ以外（#{i}）のとき" do
                let(:number_of_living_cells_around) { i }
    
                it "次世代でセルは過密か過疎により死滅すること" do
                    cell = living_cell_life_process.to_next_generation(living_cell)
                    expect(cell.status).to eq false
                end
            end
        end
    end

end