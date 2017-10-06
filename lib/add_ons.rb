require_relative 'add_ons/marchex'
require_relative 'add_ons/nomorobo'
require_relative 'add_ons/whitepages'

class AddOns
  def initialize(add_ons)
    @add_ons = add_ons
  end

  def call_blocked?
    successful? && blocked?
  end

  private

  attr_reader :add_ons

  def successful?
    add_ons['status'] == 'successful'
  end

  def blocked?
    [marchex, nomorobo, whitepages].any?(&:blocked?)
  end

  def marchex
    Marchex.new(add_ons.dig('results', 'marchex_cleancall'))
  end

  def nomorobo
    Nomorobo.new(add_ons.dig('results', 'nomorobo_spamscore'))
  end

  def whitepages
    Whitepages.new(add_ons.dig('results', 'whitepages_pro_phone_rep'))
  end
end
