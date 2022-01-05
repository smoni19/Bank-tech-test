# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'

# Class to manage account functionality
class Account
  attr_reader :balance, :account_statement

  def initialize
    @balance = 0
    @account_statement = Statement.new
  end

  def deposit(credit, date = Time.new.strftime('%d/%m/%Y'))
    check_input(credit)
    @balance += credit
    @account_statement.add_to_statement(Transaction.new(format('%.2f', credit), '', date, format('%.2f', @balance)))
  end

  def withdraw(debit, date = Time.new.strftime('%d/%m/%Y'))
    check_input(debit)
    raise 'You do not have enough money in your account!' if debit > @balance

    @balance -= debit
    @account_statement.add_to_statement(Transaction.new('', format('%.2f', debit), date, format('%.2f', @balance)))
  end

  def print_account_statement
    @account_statement.print_statement
  end

  def check_input(input)
    raise 'That is not a number!' unless input.is_a? Integer
  end
end
