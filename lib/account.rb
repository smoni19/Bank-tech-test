# frozen_string_literal: true

# Class to manage all account functionality
class Account
  attr_reader :balance, :transaction_history, :transaction

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

  def withdraw(debit, date)
    @transaction = []
    @balance -= debit
    @transaction = "#{date} || || #{debit} || #{balance}"
    @transaction_history << @transaction
  end
end
