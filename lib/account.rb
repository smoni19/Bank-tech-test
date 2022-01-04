# frozen_string_literal: true

# Class to manage all account functionality
class Account
  attr_reader :balance, :statement, :transaction

  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(credit, date)
    @balance += credit
    date = date.gsub('-', '/')
    add_to_statement("#{date} || #{format('%.2f', credit)} || || #{format('%.2f', balance)}")
  end

  def withdraw(debit, date)
    @balance -= debit
    date = date.gsub('-', '/')
    add_to_statement("#{date} || || #{format('%.2f', debit)} || #{format('%.2f', balance)}")
  end

  def add_to_statement(transaction)
    @statement << transaction
  end

  def print_statement
    statement_to_print = []
    @statement.reverse_each do |entry|
      statement_to_print << entry
    end
    puts 'date || credit || debit || balance'
    statement_to_print.each do |entry|
      puts entry
    end
  end
end
