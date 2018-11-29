require "spec_helper"
require "./map.rb"

describe "Map" do
    it "引数×引数のセルが入るマップを作る" do
        p "--"
        length = 5
        map = Map.new(length)
        expect(map.cells.size).to eq 5
        expect(map.cells[0].size).to eq 5
    end
    
    before do
        @map = Map.new(3)
        # @cells = [
        #         [true,  true,  true ],
        #         [true,　false, false],
        #         [false, true,  false]
        #       ]

        # falseで初期化してるので、trueだけセット
        @map.cells[0][0] = LivingCell.new
        @map.cells[0][1] = LivingCell.new
        @map.cells[0][2] = LivingCell.new
        @map.cells[1][0] = LivingCell.new
        @map.cells[2][1] = LivingCell.new
    end
    
    it "neighboring_cells" do
        @map.set_neighboring_cells
        
        expect(@map.cells[0][0].count_living_cells_around_me).to eq 2
        expect(@map.cells[0][1].count_living_cells_around_me).to eq 3
        expect(@map.cells[0][2].count_living_cells_around_me).to eq 1
        expect(@map.cells[1][0].count_living_cells_around_me).to eq 3
        expect(@map.cells[1][1].count_living_cells_around_me).to eq 5
        expect(@map.cells[1][2].count_living_cells_around_me).to eq 3
        expect(@map.cells[2][0].count_living_cells_around_me).to eq 2
        expect(@map.cells[2][1].count_living_cells_around_me).to eq 1
        expect(@map.cells[2][2].count_living_cells_around_me).to eq 1
    end
 
    it "change_status_to_next_generation" do
        @map.set_neighboring_cells

        @map.change_status_to_next_generation

        expect(@map.cells[0][0].status).to eq true
        expect(@map.cells[0][1].status).to eq true
        expect(@map.cells[0][2].status).to eq false
        expect(@map.cells[1][0].status).to eq true
        expect(@map.cells[1][1].status).to eq false
        expect(@map.cells[1][2].status).to eq true
        expect(@map.cells[2][0].status).to eq false
        expect(@map.cells[2][1].status).to eq false
        expect(@map.cells[2][2].status).to eq false
    end
    
    it "effective_range?(row, col)" do
        expect(@map.effective_range?(0, 0)).to eq true
        expect(@map.effective_range?(2, 2)).to eq true
        expect(@map.effective_range?(-1, -1)).to eq false
        expect(@map.effective_range?(3, 3)).to eq false
        expect(@map.effective_range?(0, -1)).to eq false
        expect(@map.effective_range?(-1, 0)).to eq false
        expect(@map.effective_range?(2, 3)).to eq false
        expect(@map.effective_range?(3, 2)).to eq false
    end
end