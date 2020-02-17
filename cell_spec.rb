require './cell'

describe "Cell" do
  describe '「生」または「死」の状態を持つ' do
    context '生存フラグに真を渡した場合' do
      let(:cell) { Cell.new(alive: true) }
      it '「生」の状態を持つこと' do
        expect(cell.alive?).to eq true
      end
      it '「死」の状態を持たないこと' do
        expect(cell.dead?).to eq false
      end
    end
  
    context '生存フラグに偽を渡した場合' do
      let(:cell) { Cell.new(alive: false) }
      it '「生」の状態を持たないこと' do
        expect(cell.alive?).to eq false
      end
      it '「死」の状態を持つこと' do
        expect(cell.dead?).to eq true
      end
    end
  end

  describe 'セルの次の世代の状態は、今の世代の隣接する生きたセルの数により決定する' do
    describe 'ルール: 誕生' do
      context '「死」の状態を持つセルに' do
        let(:cell) { Cell.new(alive: false) }

        context '隣接する生きたセルが2つの場合(境界値)' do
          let(:living_cells_count) { 2 }
          it '次の世代は「死」の状態を持つ' do
            cell.evolve!(living_cells_count)
            expect(cell.alive?).to eq false
          end
        end
      
        context '隣接する生きたセルが3つの場合' do
          let(:living_cells_count) { 3 }
          it '次の世代は「生」の状態を持つ' do
            cell.evolve!(living_cells_count)
            expect(cell.alive?).to eq true
          end
        end

        context '隣接する生きたセルが4つの場合(境界値)' do
          let(:living_cells_count) { 4 }
          it '次の世代は「死」の状態を持つ' do
            cell.evolve!(living_cells_count)
            expect(cell.alive?).to eq false
          end
        end
      end
    end

    describe 'ルール: 生存' do
      context '「生」の状態を持つセルに' do
        let(:cell) { Cell.new(alive: true) }

        context '隣接する生きたセルが2つの場合' do
          let(:living_cells_count) { 2 }
            it '次の世代は「生」の状態を持つ' do
            cell.evolve!(living_cells_count)
            expect(cell.alive?).to eq true
          end
        end
  
        context '隣接する生きたセルが3つの場合' do
          let(:living_cells_count) { 3 }
          it '次の世代は「生」の状態を持つ' do
            cell.evolve!(living_cells_count)
            expect(cell.alive?).to eq true
          end
        end
      end
    end

    describe 'ルール: 過疎' do
      context '「生」の状態を持つセルに' do
        let(:cell) { Cell.new(alive: true) }

        context '隣接する生きたセルが0　の場合' do
          let(:cell) { Cell.new(alive: true) }
          let(:living_cells_count) { 0 }
    
          it '次の世代は「死」の状態を持つ' do
            cell.evolve!(living_cells_count)
            expect(cell.alive?).to eq false
          end
        end

        context '隣接する生きたセルが1つの場合' do
          let(:cell) { Cell.new(alive: true) }
          let(:living_cells_count) { 1 }
    
          it '次の世代は「死」の状態を持つ' do
            cell.evolve!(living_cells_count)
            expect(cell.alive?).to eq false
          end
        end
      end
    end

    describe 'ルール: 過疎' do
      context '「生」の状態を持つセルに' do
        let(:cell) { Cell.new(alive: true) }

        context '隣接する生きたセルが4つの場合' do
          let(:living_cells_count) { 4 }
    
          it '次の世代は「死」の状態を持つ' do
            cell.evolve!(living_cells_count)
            expect(cell.alive?).to eq false
          end
        end
  
        context '隣接する生きたセルが8つの場合' do
          let(:living_cells_count) { 4 }
    
          it '次の世代は「死」の状態を持つ' do
            cell.evolve!(living_cells_count)
            expect(cell.alive?).to eq false
          end
        end
      end
    end
  end
end