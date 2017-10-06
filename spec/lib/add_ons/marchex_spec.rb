require_relative '../../../lib/add_ons/marchex'

describe AddOns::Marchex do
  describe '#blocked?' do
    it_behaves_like 'an add-on'

    context 'when it has a recommendation' do
      let(:marchex) do
        described_class.new(
          'status' => 'successful',
          'result' => {
            'result' => {
              'recommendation' => recommendation
            }
          }
        )
      end

      context 'and it is BLOCK' do
        let(:recommendation) { 'BLOCK' }

        it 'returns true' do
          expect(marchex).to be_blocked
        end
      end

      context 'and it is not BLOCK' do
        let(:recommendation) { 'PASS' }

        it 'returns false' do
          expect(marchex).to_not be_blocked
        end
      end
    end
  end
end
