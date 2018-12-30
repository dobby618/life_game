require "spec_helper"
require "./cell.rb"

describe "Cell" do
    
    it "自分が生きてるときの、次の生死パターン" do
        alive_cell = AliveCell.new

        # 生存
        validate_cell = AliveCell.new
        validate_cell.adjacent_cells = [alive_cell, alive_cell]
        expect(validate_cell.next.status).to eq :alive
        
        validate_cell = AliveCell.new
        validate_cell.adjacent_cells = [alive_cell, alive_cell, alive_cell]
        expect(validate_cell.next.status).to eq :alive


        # 過疎
        validate_cell = AliveCell.new
        validate_cell.adjacent_cells = []
        expect(validate_cell.next.status).to eq :dead

        validate_cell = AliveCell.new
        validate_cell.adjacent_cells = [alive_cell]
        expect(validate_cell.next.status).to eq :dead


        # 過密
        validate_cell = AliveCell.new
        validate_cell.adjacent_cells = [alive_cell, alive_cell, alive_cell, alive_cell]
        expect(validate_cell.next.status).to eq :dead

        validate_cell = AliveCell.new
        validate_cell.adjacent_cells = [alive_cell, alive_cell, alive_cell, alive_cell, alive_cell]
        expect(validate_cell.next.status).to eq :dead
        
        validate_cell = AliveCell.new
        validate_cell.adjacent_cells = [alive_cell, alive_cell, alive_cell, alive_cell, alive_cell, alive_cell]
        expect(validate_cell.next.status).to eq :dead

        validate_cell = AliveCell.new
        validate_cell.adjacent_cells = [alive_cell, alive_cell, alive_cell, alive_cell, alive_cell, alive_cell, alive_cell]
        expect(validate_cell.next.status).to eq :dead

        validate_cell = AliveCell.new
        validate_cell.adjacent_cells = [alive_cell, alive_cell, alive_cell, alive_cell, alive_cell, alive_cell, alive_cell, alive_cell]
        expect(validate_cell.next.status).to eq :dead
    end
    
    it "自分が死んでるときの、次の生死パターン" do
        alive_cell = AliveCell.new
        
        validate_cell = DeadCell.new

        # 誕生する
        validate_cell = DeadCell.new
        validate_cell.adjacent_cells = [alive_cell, alive_cell, alive_cell]
        expect(validate_cell.next.status).to eq :alive

        # 誕生しない
        validate_cell = DeadCell.new
        validate_cell.adjacent_cells = []
        expect(validate_cell.next.status).to eq :dead

        validate_cell = DeadCell.new
        validate_cell.adjacent_cells = [alive_cell]
        expect(validate_cell.next.status).to eq :dead

        validate_cell = DeadCell.new
        validate_cell.adjacent_cells = [alive_cell, alive_cell]
        expect(validate_cell.next.status).to eq :dead

        validate_cell = DeadCell.new
        validate_cell.adjacent_cells = [alive_cell, alive_cell, alive_cell, alive_cell]
        expect(validate_cell.next.status).to eq :dead

        validate_cell = DeadCell.new
        validate_cell.adjacent_cells = [alive_cell, alive_cell, alive_cell, alive_cell, alive_cell]
        expect(validate_cell.next.status).to eq :dead

        validate_cell = DeadCell.new
        validate_cell.adjacent_cells = [alive_cell, alive_cell, alive_cell, alive_cell, alive_cell, alive_cell]
        expect(validate_cell.next.status).to eq :dead

        validate_cell = DeadCell.new
        validate_cell.adjacent_cells = [alive_cell, alive_cell, alive_cell, alive_cell, alive_cell, alive_cell, alive_cell]
        expect(validate_cell.next.status).to eq :dead

        validate_cell = DeadCell.new
        validate_cell.adjacent_cells = [alive_cell, alive_cell, alive_cell, alive_cell, alive_cell, alive_cell, alive_cell, alive_cell]
        expect(validate_cell.next.status).to eq :dead
    end
end