require "spec_helper"
require "./lib/dead_cell"
require "./lib/alive_cell"

describe "Cell" do
  context "DeadCell" do
    it "死んでいるセルに隣接するいきたセルがちょうど3つであれば、次の世代で誕生する" do
      dead_cell = DeadCell.new
      expect(dead_cell.evolve(3).class).to eq AliveCell
    end

    it "死んでいるセルに隣接するいきたセルが3以外であれば、次の世代でも死んでいるセルである" do
      dead_cell = DeadCell.new
      [0, 2, 4].each do |i|
        expect(dead_cell.evolve(i).class).to eq DeadCell
      end
    end
  end

  context "AliveCell" do
    it "生きているセルに隣接する生きたセルが2つか3つならば、次の世代でも生存する" do
      alive_cell = AliveCell.new
      expect(alive_cell.evolve(2).class).to eq AliveCell
      expect(alive_cell.evolve(3).class).to eq AliveCell
    end

    it "生きているセルに隣接する生きたセルが1つ以下ならば、過疎により死滅する" do
      alive_cell = AliveCell.new
      expect(alive_cell.evolve(0).class).to eq DeadCell
      expect(alive_cell.evolve(1).class).to eq DeadCell
    end

    it "生きているセルに隣接する生きたセルが4つ以上ならば、過密により死滅する" do
      alive_cell = AliveCell.new
      expect(alive_cell.evolve(4).class).to eq DeadCell
    end
  end
end