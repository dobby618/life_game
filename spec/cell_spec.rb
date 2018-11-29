require "spec_helper"
require "./cell.rb"

describe "Cell" do
    
    it "自分が生きてるときの、次の生死パターン" do
        living_cell = LivingCell.new
        
        # 生存
        expect(living_cell.life_and_death_rule(2)).to eq true
        expect(living_cell.life_and_death_rule(3)).to eq true
        # 過疎
        expect(living_cell.life_and_death_rule(0)).to eq false
        expect(living_cell.life_and_death_rule(1)).to eq false
        # 過密
        expect(living_cell.life_and_death_rule(4)).to eq false
        expect(living_cell.life_and_death_rule(5)).to eq false
        expect(living_cell.life_and_death_rule(6)).to eq false
        expect(living_cell.life_and_death_rule(7)).to eq false
        expect(living_cell.life_and_death_rule(8)).to eq false

    end
    
    it "自分が死んでるときの、次の生死パターン" do

        dead_cell = DeadCell.new
        # 誕生
        expect(dead_cell.life_and_death_rule(3)).to eq true
        # 誕生しない
        expect(dead_cell.life_and_death_rule(0)).to eq false
        expect(dead_cell.life_and_death_rule(1)).to eq false
        expect(dead_cell.life_and_death_rule(2)).to eq false
        expect(dead_cell.life_and_death_rule(4)).to eq false
        expect(dead_cell.life_and_death_rule(5)).to eq false
        expect(dead_cell.life_and_death_rule(6)).to eq false
        expect(dead_cell.life_and_death_rule(7)).to eq false
        expect(dead_cell.life_and_death_rule(8)).to eq false

    end
    

   it "周りの数を数える" do
        # 1 0 1
        # 0 0 0
        # 1 1 1

        cell = LivingCell.new
        cell.status_of_cells_around = [false, false, false]
        expect(cell.count_living_cells_around_me).to eq 0
        
        cell = DeadCell.new
        cell.status_of_cells_around = [true, false, false, false, true]
        expect(cell.count_living_cells_around_me).to eq 2
        
        cell = LivingCell.new
        cell.status_of_cells_around = [false, false, false]
        expect(cell.count_living_cells_around_me).to eq 0

        cell = DeadCell.new
        cell.status_of_cells_around = [true, false, false, true, true]
        expect(cell.count_living_cells_around_me).to eq 3

        cell = DeadCell.new
        cell.status_of_cells_around = [false, true, false, true, true, true, false, true]
        expect(cell.count_living_cells_around_me).to eq 5

        cell = DeadCell.new
        cell.status_of_cells_around = [true, true, true, false, false]
        expect(cell.count_living_cells_around_me).to eq 3

        cell = LivingCell.new
        cell.status_of_cells_around = [false, false, true]
        expect(cell.count_living_cells_around_me).to eq 1
        
        cell = LivingCell.new
        cell.status_of_cells_around = [false, false, true, true, false]
        expect(cell.count_living_cells_around_me).to eq 2
        
        cell = LivingCell.new
        cell.status_of_cells_around = [false, true, false]
        expect(cell.count_living_cells_around_me).to eq 1
    end
    
end