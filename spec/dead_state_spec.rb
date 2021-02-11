require './scenarios/dead_state'

describe 'DeadState' do
  let(:current_state) { DeadState.instance }

  describe 'ルール: 誕生' do
    context '隣接する生きたセルが2つの場合(境界値)' do
      let(:living_cells_count) { 2 }

      it '次の世代は「死」の状態を持つ' do
        next_state = current_state.step_up(living_cells_count)
        expect(next_state.to_sym).to eq :dead
      end
    end

    context '隣接する生きたセルが3つの場合' do
      let(:living_cells_count) { 3 }

      it '次の世代は「生」の状態を持つ' do
        next_state = current_state.step_up(living_cells_count)
        expect(next_state.to_sym).to eq :living
      end
    end

    context '隣接する生きたセルが4つの場合(境界値)' do
      let(:living_cells_count) { 4 }

      it '次の世代は「死」の状態を持つ' do
        next_state = current_state.step_up(living_cells_count)
        expect(next_state.to_sym).to eq :dead
      end
    end
  end
end
