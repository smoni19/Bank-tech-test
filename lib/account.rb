# frozen_string_literal: true

# Class to manage all account functionality
class Account
  attr_reader :balance, :transaction_history, :transaction

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(credit, date)
    @balance += credit
    date = date.gsub('-','/') 
    add_to_transaction_history("#{date} || #{credit} || || #{balance}")
  end

  def withdraw(debit, date)
    @balance -= debit
    date = date.gsub('-','/') 
    add_to_transaction_history("#{date} || || #{debit} || #{balance}")
  end

  def add_to_transaction_history(transaction)
    @transaction_history << transaction
  end
end
