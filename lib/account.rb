# frozen_string_literal: true

# Class to manage all account functionality
class Account
  attr_reader :balance, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(credit, date)
    @transaction = []
    @balance += credit
    @transaction = "#{date} || #{credit} || || #{balance}"
    @transaction_history << @transaction
  end
end
