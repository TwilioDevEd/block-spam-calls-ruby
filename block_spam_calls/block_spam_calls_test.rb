require_relative './block_spam_calls'
require 'test/unit'
require 'rack/test'

set :environment, :test

class BlockSpamCallsTest < Test::Unit::TestCase
    include Rack::Test::Methods

    def app
        Sinatra::Application
    end

    def load_json_fixture(filename)
        fixture_path = File.join('../fixtures', filename)
        return IO.read(File.expand_path(fixture_path, __FILE__), :encoding => 'BOM|UTF-8')
    end

    def test_successful_without_add_ons
        post '/'
        assert last_response.ok?
        assert_no_match(/\<Reject/, last_response.body)
    end

    def test_successful_with_marchex
        fixture = load_json_fixture('successful_marchex.json')
        post '/', 'AddOns' => fixture
        assert last_response.ok?
        assert_no_match(/\<Reject/, last_response.body)
    end

    def test_blocked_with_marchex
        fixture = load_json_fixture('spam_marchex.json')
        post '/', 'AddOns' => fixture
        assert last_response.ok?
        assert_match(/Reject/, last_response.body)
    end

    def test_successful_with_nomorobo
        fixture = load_json_fixture('successful_nomorobo.json')
        post '/', 'AddOns' => fixture
        assert last_response.ok?
        assert_no_match(/\<Reject/, last_response.body)
    end

    def test_blocked_with_nomorobo
        fixture = load_json_fixture('spam_nomorobo.json')
        post '/', 'AddOns' => fixture
        assert last_response.ok?
        assert_match(/Reject/, last_response.body)
    end

    def test_successful_with_whitepages
        fixture = load_json_fixture('successful_whitepages.json')
        post '/', 'AddOns' => fixture
        assert last_response.ok?
        assert_no_match(/\<Reject/, last_response.body)
    end

    def test_blocked_with_whitepages
        fixture = load_json_fixture('spam_whitepages.json')
        post '/', 'AddOns' => fixture
        assert last_response.ok?
        assert_match(/Reject/, last_response.body)
    end

    def test_successful_with_nomorobo_api_failure
        fixture = load_json_fixture('failed_nomorobo.json')
        post '/', 'AddOns' => fixture
        assert last_response.ok?
        assert_no_match(/Reject/, last_response.body)
    end
end