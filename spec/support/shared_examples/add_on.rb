shared_examples 'an add-on' do
  context 'when add-on is nil' do
    it 'returns false' do
      add_on = described_class.new(nil)
      expect(add_on).to_not be_blocked
    end
  end

  context 'when the status is not successful' do
    it 'returns false' do
      add_on = described_class.new('status' => 'failed')
      expect(add_on).to_not be_blocked
    end
  end
end

