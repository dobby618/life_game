require "spec_helper"
require "./lib/dead_cell"
require "./lib/living_cell"

context "DeadCell" do
  let(:dead_cell) { DeadCell.new(ids) }
  let(:ids) { (1..4).to_a }

  context "living?" do
    it { expect(dead_cell.living?).to eq false }
  end

  context "evolve" do
    context "隣接する生きたセルが3つの場合" do
      it "LivingCellのオブジェクトを返す" do
        expect(dead_cell.evolve(3)).to be_a LivingCell
      end
    end

    [0, 2, 4].each do |i|
      context "隣接する生きたセルが#{i}つの場合" do
        it "DeadCellのオブジェクトを返す" do
          expect(dead_cell.evolve(i)).to be_a DeadCell
        end
      end
    end
  end

  context "living_or_dead_in_next_generation?" do
    context "隣接する生きたセルが3つの場合" do
      it "True を返す" do
        expect(dead_cell.living_or_dead_in_next_generation?(3)).to eq true
      end
    end

    [0, 2, 4].each do |i|
      context "隣接する生きたセルが#{i}つの場合" do
        it "False を返す" do
          expect(dead_cell.living_or_dead_in_next_generation?(i)).to eq false
        end
      end
    end
  end
end
