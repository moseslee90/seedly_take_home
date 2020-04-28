require './notification'

RSpec.describe Main do
  describe '#add' do
    it 'returns sum of arguments' do
      expect(Main.new.add(1, 2)).to eq(3)
    end
  end
end
