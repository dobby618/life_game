require "spec_helper"
require "./lib/dead_cell"
require "./lib/living_cell"

context "LivingCell" do
  let(:living_cell) { LivingCell.new(ids) }
  let(:ids) { (1..4).to_a }

  context "living?" do
    it { expect(living_cell.living?).to eq true }
  end

  context "evolve" do
    [2, 3].each do |i|
      context "隣接する生きたセルが#{i}つの場合" do
        it "LivingCellのオブジェクトを返す" do
          expect(living_cell.evolve(i)).to be_a LivingCell
        end
      end
    end

    [0, 1, 4].each do |i|
      context "隣接する生きたセルが#{i}つの場合" do
        it "DeadCellのオブジェクトを返す" do
          expect(living_cell.evolve(i)).to be_a DeadCell
        end
      end
    end
  end

  context "living_or_dead_in_next_generation?" do
    [2, 3].each do |i|
      context "隣接する生きたセルが#{i}つの場合" do
        it "True を返す" do
          expect(living_cell.living_or_dead_in_next_generation?(i)).to eq true
        end
      end
    end

    [0, 1, 4].each do |i|
      context "隣接する生きたセルが#{i}つの場合" do
        it "False を返す" do
          expect(living_cell.living_or_dead_in_next_generation?(i)).to eq false
        end
      end
    end
  end
end