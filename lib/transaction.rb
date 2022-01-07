require_relative 'account'
require_relative 'statement'

class Transaction
  attr_reader :amount, :date

  def initialize(amount, date)
    @amount = amount
    @date = date
  end
end
