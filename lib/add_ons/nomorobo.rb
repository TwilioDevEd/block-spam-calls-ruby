class AddOns
  class Nomorobo
    SPAM_SCORE = 1

    def initialize(nomorobo)
      @nomorobo = nomorobo
    end

    def blocked?
      return false unless successful?
      nomorobo.dig('result', 'score') == SPAM_SCORE
    end

    private

    attr_reader :nomorobo

    def successful?
      nomorobo && nomorobo['status'] == 'successful'
    end
  end
end
