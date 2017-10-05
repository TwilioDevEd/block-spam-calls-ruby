class AddOns
  class Marchex
    def initialize(marchex)
      @marchex = marchex
    end

    def blocked?
      return false unless successful?
      recommendation = marchex.dig('result', 'result', 'recommendation')
      recommendation == 'BLOCK'
    end

    private

    attr_reader :marchex

    def successful?
      marchex && marchex['status'] == 'successful'
    end
  end
end
