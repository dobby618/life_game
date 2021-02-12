require_relative '../entities/field'
require_relative '../ui/char_view'

describe 'CharView' do
  let(:view) { CharView.instance }

  describe 'Observer interface' do
    it { expect(view).to respond_to(:update) }
  end
end
