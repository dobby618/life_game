require "spec_helper"
require "./lib/dead_cell"
require "./lib/living_cell"

describe "Cell" do
  context "DeadCell" do
    let(:dead_cell) { DeadCell.new }

    context "隣接する生きたセルが3つの場合" do
      it "True を返す" do
        expect(dead_cell.alive_in_next_generation?(3)).to eq true
      end
    end

    [0, 2, 4].each do |i|
      context "隣接する生きたセルが#{i}つの場合" do
        it "False を返す" do
          expect(dead_cell.alive_in_next_generation?(i)).to eq false
        end
      end
    end
  end

  context "AliveCell" do
    let(:living_cell) { LivingCell.new }

    [2, 3].each do |i|
      context "隣接する生きたセルが#{i}つの場合" do
        it "True を返す" do
          expect(living_cell.alive_in_next_generation?(i)).to eq true
        end
      end
    end

    [0, 1, 4].each do |i|
      context "隣接する生きたセルが#{i}つの場合" do
        it "False を返す" do
          expect(living_cell.alive_in_next_generation?(i)).to eq false
        end
      end
    end
  end
end