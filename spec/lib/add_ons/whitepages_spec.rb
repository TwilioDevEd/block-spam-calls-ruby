require_relative '../../../lib/add_ons/whitepages'

describe AddOns::Whitepages do
  describe '#blocked?' do
    it_behaves_like 'an add-on'

    context 'when it has results' do
      let(:whitepages) do
        described_class.new(
          'status' => 'successful',
          'result' => {
            'reputation_level' => reputation_level
          }
        )
      end

      context 'and the reputation level is bad' do
        let(:reputation_level) { 4 }

        it 'returns true' do
          expect(whitepages).to be_blocked
        end
      end

      context 'and the reputation level is good' do
        let(:reputation_level) { 2 }

        it 'returns false' do
          expect(whitepages).to_not be_blocked
        end
      end
    end
  end
end
