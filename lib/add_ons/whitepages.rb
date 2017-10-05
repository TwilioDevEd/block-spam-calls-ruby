class AddOns
  class Whitepages
    BAD_REPUTATION = 4

    def initialize(whitepages)
      @whitepages = whitepages
    end

    def blocked?
      return false unless successful?
      result = whitepages['result']
      result && result['reputation_level'] == BAD_REPUTATION
    end

    private

    attr_reader :whitepages

    def successful?
      whitepages && whitepages['status'] == 'successful'
    end
  end
end
