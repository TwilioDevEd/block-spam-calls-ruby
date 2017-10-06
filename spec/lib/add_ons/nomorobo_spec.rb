require_relative '../../../lib/add_ons/nomorobo'

describe AddOns::Nomorobo do
  describe '#blocked?' do
    it_behaves_like 'an add-on'

    context 'when it has a score' do
      let(:nomorobo) do
        described_class.new(
          'status' => 'successful',
          'result' => {
            'score' => score
          }
        )
      end

      context 'and it is 1' do
        let(:score) { 1 }

        it 'returns true' do
          expect(nomorobo).to be_blocked
        end
      end

      context 'and it is not 0' do
        let(:score) { 0 }

        it 'returns false' do
          expect(nomorobo).to_not be_blocked
        end
      end
    end
  end
end
