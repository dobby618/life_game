require_relative '../usecases/cell_factory'

describe 'CellFactory' do
  let(:factory) { CellFactory.instance }

  context '「生」フラグを渡した場合' do
    let(:cell) { factory.create(:living) }

    it 'セルは「生」の状態を持つこと' do
      expect(cell.state).to eq :living
    end
  end

  context '「死」フラグを渡した場合' do
    let(:cell) { factory.create(:dead) }

    it 'セルは「死」の状態を持つこと' do
      expect(cell.state).to eq :dead
    end
  end

  context '生死以外のフラグを渡した場合' do
    let(:cell) { factory.create(:dummy) }

    it '例外になること' do
      expect { cell.state }.to raise_error(NoMatchingPatternError)
    end
  end
end
