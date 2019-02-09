require "spec_helper"
require "./cell"
require "./life_game"
require "./rule"


describe "生存" do
    let(:cell_1) { Cell.new(cell_1_status) }
    let(:cell_2) { Cell.new(cell_2_status) }

    context "自分が生きてる、相手が生きてる状態のとき" do
        let(:cell_1_status) { true }
        let(:cell_2_status) { true }
        
        it "次世代で2人とも生きる" do
            LifeGame.next_generate(cell_1, [cell_2])
            expect(cell_1.status).to eq true
            expect(cell_2.status).to eq true
        end
    end
    
    context "自分が死んでる、相手が死んでる状態のとき" do
        let(:cell_1_status) { false }
        let(:cell_2_status) { false }
        
        it "次世代で2人とも生きる" do
            LifeGame.next_generate(cell_1, [cell_2])
            expect(cell_1.status).to eq true
            expect(cell_2.status).to eq true
        end
    end
    
    context "自分が生きてる、相手が死んでる状態のとき" do
        let(:cell_1_status) { true }
        let(:cell_2_status) { false }
        
        it "次世代で2人とも死ぬ" do
            LifeGame.next_generate(cell_1, [cell_2])
            expect(cell_1.status).to eq false
            expect(cell_2.status).to eq false
        end
    end
    
    context "自分が死んでる、相手が生きてる状態のとき" do
        let(:cell_1_status) { false }
        let(:cell_2_status) { true }
        
        it "次世代で2人とも死ぬ" do
            LifeGame.next_generate(cell_1, [cell_2])
            expect(cell_1.status).to eq false
            expect(cell_2.status).to eq false
        end
    end
end