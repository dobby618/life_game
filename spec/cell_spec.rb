require "spec_helper"
require "./lib/dead_cell"
require "./lib/living_cell"

describe "Cell" do
  context "DeadCell" do
    it "死んでいるセルに隣接するいきたセルがちょうど3つであれば、次の世代で誕生する" do
      dead_cell = DeadCell.new
      expect(dead_cell.alive_in_next_generation?(3)).to eq true
    end

    it "死んでいるセルに隣接するいきたセルが3以外であれば、次の世代でも死んでいるセルである" do
      dead_cell = DeadCell.new
      [0, 2, 4].each do |i|
        expect(dead_cell.alive_in_next_generation?(i)).to eq false
      end
    end
  end

  context "AliveCell" do
    it "生きているセルに隣接する生きたセルが2つか3つならば、次の世代でも生存する" do
      living_cell = LivingCell.new
      expect(living_cell.alive_in_next_generation?(2)).to eq true
      expect(living_cell.alive_in_next_generation?(3)).to eq true
    end

    it "生きているセルに隣接する生きたセルが1つ以下ならば、過疎により死滅する" do
      living_cell = LivingCell.new
      expect(living_cell.alive_in_next_generation?(0)).to eq false
      expect(living_cell.alive_in_next_generation?(1)).to eq false
    end

    it "生きているセルに隣接する生きたセルが4つ以上ならば、過密により死滅する" do
      living_cell = LivingCell.new
      expect(living_cell.alive_in_next_generation?(4)).to eq false
    end
  end
end