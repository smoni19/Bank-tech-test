# frozen_string_literal: true

require_relative 'account'
require_relative 'transaction'

# Class to manage statement functionality
class Statement
  attr_reader :statement, :transaction

  def initialize
    @statement = []
  end

  def add_to_statement(transaction)
    @statement << transaction
  end

  def print_statement
    puts 'date || credit || debit || balance'
    statement.reverse_each do |transaction|
      puts "#{transaction.date.gsub('-', '/')} || #{get_transaction_type(transaction)} || #{transaction.balance}"
    end
  end

  def get_transaction_type(transaction)
    transaction.credit > transaction.debit ? "#{transaction.credit} ||" : "|| #{transaction.debit}"
  end
end
