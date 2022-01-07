require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def deposit(amount, date = Time.new.strftime('%d/%m/%Y'))
    check_input(amount)
    @transactions.push(Transaction.new(amount, date))
  end

  def withdraw(amount, date = Time.new.strftime('%d/%m/%Y'))
    check_input(amount)
    check_balance(amount)
    @transactions.push(Transaction.new(-amount, date))
  end

  def check_balance(amount)
    balances = []
    @transactions.each { |transaction| balances << transaction.amount }
    raise 'You do not have enough money in your account!' if amount > balances.sum
  end

  def check_input(input)
    raise 'That is not a number!' unless input.is_a? Numeric
  end
end
