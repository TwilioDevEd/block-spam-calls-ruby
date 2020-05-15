require_relative 'add_ons/marchex'
require_relative 'add_ons/nomorobo'
require_relative 'add_ons/ekata'

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
    [marchex, nomorobo, ekata].any?(&:blocked?)
  end

  def marchex
    Marchex.new(add_ons.dig('results', 'marchex_cleancall'))
  end

  def nomorobo
    Nomorobo.new(add_ons.dig('results', 'nomorobo_spamscore'))
  end

  def ekata
    Ekata.new(add_ons.dig('results', 'ekata_phone_valid'))
  end
end
