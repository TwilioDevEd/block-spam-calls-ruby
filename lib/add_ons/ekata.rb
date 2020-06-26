class AddOns
  class Ekata
    BAD_REPUTATION = 4

    def initialize(ekata)
      @ekata = ekata
    end

    def blocked?
      return false unless successful?
      result = ekata['result']
      result && result['reputation_level'] == BAD_REPUTATION
    end

    private

    attr_reader :ekata

    def successful?
      ekata && ekata['status'] == 'successful'
    end
  end
end
