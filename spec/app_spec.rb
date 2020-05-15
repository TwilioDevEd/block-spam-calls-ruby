require_relative 'spec_helper'

describe 'Application' do
  context 'when there are add-ons' do
    context 'and the add-on is marchex' do
      context 'and its response indicates success' do
        it 'responds with message' do
          marchex = load_json_fixture('successful_marchex.json')
          post '/', 'AddOns' => marchex
          expect(last_response.body).to say('Welcome to the jungle')
        end
      end

      context 'and its response indicates spam' do
        it 'rejects the call' do
          marchex = load_json_fixture('spam_marchex.json')
          post '/', 'AddOns' => marchex
          expect(last_response.body).to be_rejected
        end
      end
    end

    context 'and the add-on is nomorobo' do
      context 'and its response indicates success' do
        it 'responds with message' do
          nomorobo = load_json_fixture('successful_nomorobo.json')
          post '/', 'AddOns' => nomorobo
          expect(last_response.body).to say('Welcome to the jungle')
        end
      end

      context 'and its response indicates spam' do
        it 'rejects the call' do
          nomorobo = load_json_fixture('spam_nomorobo.json')
          post '/', 'AddOns' => nomorobo
          expect(last_response.body).to be_rejected
        end
      end
    end

    context 'and the add-on is ekata' do
      context 'and its response indicates success' do
        it 'responds with message' do
          ekata = load_json_fixture('successful_ekata.json')
          post '/', 'AddOns' => ekata
          expect(last_response.body).to say('Welcome to the jungle')
        end
      end

      context 'and its response contains a failure' do
        it 'responds with message' do
          ekata = load_json_fixture('failed_nomorobo.json')
          post '/', 'AddOns' => ekata
          expect(last_response.body).to say('Welcome to the jungle')
        end
      end

      context 'and its response indicates spam' do
        it 'rejects the call' do
          ekata = load_json_fixture('spam_ekata.json')
          post '/', 'AddOns' => ekata
          expect(last_response.body).to be_rejected
        end
      end
    end
  end

  context 'when there are not add-ons' do
    it 'responds with ok' do
      post '/'
      expect(last_response).to be_ok
    end
  end
end

