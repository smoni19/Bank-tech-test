# frozen_string_literal: true

require 'statement'

describe '#add_to_statement' do
  before do
    @account = Account.new
  end

  it 'should add deposit and withdrawal information to transcation_history' do
    @account.deposit(1000.00, '10-01-2023')
    expect(@account.account_statement.statement[0].credit).to eq "1000.00"
  end
end

describe '#print_statement' do
  before do
    @account = Account.new
    @account.deposit(1000.00, '10-01-2023')
    @account.deposit(2000.00, '13-01-2023')
    @account.withdraw(500.00, '14-01-2023')
  end

  it 'should return information about all transactions made on the account with headers' do
    expect(@account.print_account_statement).to be
    ['date || credit || debit || balance',
     '14/01/2023 || || 500.00 || 2500.00',
     '13/01/2023 || 2000.00 || || 3000.00',
     '10/01/2023 || 1000.00 || || 1000.00']
  end
end
