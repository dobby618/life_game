require "spec_helper"
require "./lib/field"
require "./lib/dead_cell"
require "./lib/living_cell"

describe "Field" do
  # let(:field) { Field.new }

  # it "死んでいるセルに隣接する生きたセルがちょうど3つであれば、次の世代で誕生する" do
  #   expect(field.evolve(DeadCell.new, 3)).to be_a LivingCell
  # end

  # it "死んでいるセルに隣接する生きたセルが3以外であれば、次の世代でも死んでいるセルである" do
  #   expect(field.evolve(DeadCell.new, 4)).to be_a DeadCell
  # end

  # it "生きているセルに隣接する生きたセルが2つか3つならば、次の世代でも生存する" do
  #   expect(field.evolve(LivingCell.new, 2)).to be_a LivingCell
  #   expect(field.evolve(LivingCell.new, 3)).to be_a LivingCell
  # end

  # it "生きているセルに隣接する生きたセルが1つ以下ならば、過疎により死滅する" do
  #   expect(field.evolve(LivingCell.new, 1)).to be_a DeadCell
  # end

  # it "生きているセルに隣接する生きたセルが4つ以上ならば、過密により死滅する" do
  #   expect(field.evolve(LivingCell.new, 4)).to be_a DeadCell
  # end
end