require_relative '../usecases/field_factory'
require_relative '../usecases/block_field'

describe 'FieldFactory' do
  let(:factory) { FieldFactory.instance }

  context ':block を渡した場合' do
    it { expect(factory.create(:block)).to be_an_instance_of(BlockField) }
  end

  context '存在しない名前を渡した場合' do
    it { expect { factory.create(:dummy) }.to raise_error(NoMatchingPatternError) }
  end
end
