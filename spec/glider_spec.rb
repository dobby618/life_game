require "spec_helper"
require "./lib/bord"

describe "Glider" do
    let(:glider) { Glider.new }

    context "グライダー初期世代の場合" do
        it "グライダーの初期値がセットできている" do
            expect(glider.get_status(x: 0, y: 0)).to eq true
            expect(glider.get_status(x: 1, y: 2)).to eq false
            expect(glider.get_status(x: 2, y: 1)).to eq true
        end
    end
    
    context "グライダー第二世代目の場合" do
        before { glider.next }
        it "グライダーの第二世代のセルがセットできている" do
            expect(glider.get_status(x: 0, y: 0)).to eq true
            expect(glider.get_status(x: 0, y: 1)).to eq true
            expect(glider.get_status(x: 0, y: 2)).to eq false
            expect(glider.get_status(x: 1, y: 0)).to eq true
            expect(glider.get_status(x: 1, y: 1)).to eq false
            expect(glider.get_status(x: 1, y: 2)).to eq true
            expect(glider.get_status(x: 2, y: 0)).to eq false
            expect(glider.get_status(x: 2, y: 1)).to eq false
            expect(glider.get_status(x: 2, y: 2)).to eq false
        end
    end
    
    context "グライダー第３世目代の場合" do
        before do
            glider.next
            glider.next
        end
        it "グライダーの第３世代のセルがセットできている" do
            expect(glider.get_status(x: 0, y: 0)).to eq true
            expect(glider.get_status(x: 0, y: 1)).to eq true
            expect(glider.get_status(x: 0, y: 2)).to eq false
            expect(glider.get_status(x: 1, y: 0)).to eq true
            expect(glider.get_status(x: 1, y: 1)).to eq false
            expect(glider.get_status(x: 1, y: 2)).to eq false
            expect(glider.get_status(x: 2, y: 0)).to eq false
            expect(glider.get_status(x: 2, y: 1)).to eq false
            expect(glider.get_status(x: 2, y: 2)).to eq false
        end
    end
end