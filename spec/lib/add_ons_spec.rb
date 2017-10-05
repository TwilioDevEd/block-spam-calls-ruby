require_relative '../../lib/add_ons'

describe AddOns do
  describe '#call_blocked?' do
    context 'when status is not successful' do
      it 'returns false' do
        add_ons = AddOns.new('status' => 'fail')
        expect(add_ons).to_not be_call_blocked
      end
    end

    context 'when status is successful' do
      subject(:add_ons) { AddOns.new('status' => 'successful') }

      context 'and an addon is blocked' do
        it 'returns true' do
          allow_any_instance_of(AddOns::Marchex).to receive(:blocked?) { true }
          expect(add_ons).to be_call_blocked
        end
      end

      context 'and an addon is not blocked' do
        it 'returns true' do
          allow_any_instance_of(AddOns::Marchex).to receive(:blocked?) { false }
          expect(add_ons).to_not be_call_blocked
        end
      end
    end
  end
end
