# frozen_string_literal: true

# Class to manage all account functionality
class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end
end
