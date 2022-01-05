# frozen_string_literal: true

require_relative 'account'
require_relative 'statement'

# Class to manage transaction functionality
class Transaction
  attr_reader :balance, :date, :debit, :credit

  def initialize(credit, debit, date, balance)
    @credit = credit
    @debit = debit
    @date = date
    @balance = balance
  end
end
