require "spec_helper"
require "./lib/bord"

describe "Bord" do
    let(:bord) { Bord.new(height: height, width: width) }

    context "縦２、横２のボードのとき" do
        let(:height) { 2 }
        let(:width)   { 2 }
        
        it "升目ごとに値をセットできる" do
            bord.set(x: 0, y: 1, status: true)
            expect(bord.get_status(x: 0, y: 1)).to eq true
        end
    end
end