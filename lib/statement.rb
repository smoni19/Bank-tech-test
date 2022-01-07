require_relative 'account'

class Statement
  def self.print_statement(statement)
    puts 'date || credit || debit || balance'
    calculate_balance(statement).reverse_each do |transaction, balance|
      puts "#{transaction.date.gsub('-', '/')} || #{credit_or_debit(transaction.amount)} || #{convert_to_float(balance)}"
    end
  end

  def self.convert_to_float(number)
    format('%.2f', number)
  end

  def self.calculate_balance(statement)
    balances = []
    balance = 0
    statement.each { |transaction| balances << balance += transaction.amount }
    statement.zip(balances)
  end

  def self.credit_or_debit(transaction)
    transaction > 0 ? "#{convert_to_float(transaction)} ||" : "|| #{convert_to_float(transaction)[1..-1]}"
  end
end
