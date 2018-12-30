require "spec_helper"
require "./field.rb"
require "./drawing"

describe "SquareFiled" do
    it "升目（セルの数）が正しいか確認する" do
        field = SquareFiled.new(3)
        expect(field.cells.size).to eq 8
        
        field = SquareFiled.new(5)
        expect(field.cells.size).to eq 24
    end
end