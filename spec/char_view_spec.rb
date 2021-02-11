# rspec にしていること。
# observer interface の update を実装していること。
require './entities/field'
require './ui/char_view'

describe 'CharView' do
  let(:view) { CharView.instance }

  describe 'Observer interface' do
    it { expect(view).to respond_to(:update) }
  end
end
