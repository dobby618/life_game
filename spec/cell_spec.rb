require "spec_helper"
require "./lib/cell"
require "./lib/bord"

describe "Cell" do
    let(:glider) { Glider.new }
    let(:cell)   { Cell.new(status: status, living_cells: living_cells) }

    context "グライダー(0, 0)のとき" do
        let(:status) { true }
        let(:living_cells) { [[0, 1], [1, 0], [1, 1]] }
        
        it "生存すること" do
            expect(cell.next_status(glider)).to eq true
        end
    end
    
    context "グライダー(0, 1)のとき" do
        let(:status) { true }
        let(:living_cells) { [[0, 0], [0, 2], [1, 0], [1, 1], [1, 2]] }
        
        it "生存すること" do
            expect(cell.next_status(glider)).to eq true
        end
    end
    
    context "グライダー(0, 2)のとき" do
        let(:status) { true }
        let(:living_cells) { [[0, 1], [1, 1], [1, 2]] }
        
        it "過疎すること" do
            expect(cell.next_status(glider)).to eq false
        end
    end
    
    context "グライダー(1, 0)のとき" do
        let(:status) { true }
        let(:living_cells) { [[0, 0], [0, 1], [1, 1], [2, 0], [2, 1]] }
        
        it "生存すること" do
            expect(cell.next_status(glider)).to eq true
        end
    end

    context "グライダー(1, 1)のとき" do
        let(:status) { false }
        let(:living_cells) { [[0, 0], [0, 1], [0, 2], [1, 0], [1, 2], [2, 0], [2, 1], [2, 2]] }
        
        it "現状維持すること" do
            expect(cell.next_status(glider)).to eq false
        end
    end

    context "グライダー(1, 2)のとき" do
        let(:status) { false }
        let(:living_cells) { [[0, 1], [0, 2], [1, 1], [2, 1], [2, 2]] }
        
        it "生存すること" do
            expect(cell.next_status(glider)).to eq true
        end
    end
    
    context "グライダー(2, 0)のとき" do
        let(:status) { false }
        let(:living_cells) { [[1, 0], [1, 1], [2, 1]] }
        
        it "生存すること" do
            expect(cell.next_status(glider)).to eq false
        end
    end

    context "グライダー(2, 1)のとき" do
        let(:status) { true }
        let(:living_cells) { [[1, 0], [1, 1], [1, 2], [2, 0], [2, 2]] }
        
        it "現状維持すること" do
            expect(cell.next_status(glider)).to eq false
        end
    end

    context "グライダー(2, 2)のとき" do
        let(:status) { false }
        let(:living_cells) { [[1, 1], [1, 2], [2, 1]] }
        
        it "生存すること" do
            expect(cell.next_status(glider)).to eq false
        end
    end
end