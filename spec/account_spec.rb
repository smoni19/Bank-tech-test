# frozen_string_literal: true

require 'account'

describe Account do
  before do
    @account = Account.new
  end

  it 'starts with a balance of 0' do
    expect(@account.balance).to eq 0
  end

  it 'should start empty' do
    expect(@account.statement.length).to eq 0
  end
end

describe '#deposit' do
  before do
    @account = Account.new
    @account.deposit(1000.00, '10-01-2023')
  end

  it 'should increase statement length by 1 when a deposit is made' do
    expect(@account.statement.length).to eq 1
  end

  it 'should take an amount and date argument and increase balance' do
    @account.deposit(2000, '13-01-2023')
    expect(@account.balance).to eq 3000
  end
end

describe '#withdraw' do
  before do
    @account = Account.new
    @account.deposit(1000.00, '10-01-2023')
  end

  it 'should take an amount and date argument and decrease balance' do
    @account.withdraw(1000.00, '10-01-2023')
    expect(@account.balance).to eq 0
  end
end

describe '#add_to_statement' do
  before do
    @account = Account.new
    @account.deposit(1000.00, '10-01-2023')
  end

  it 'should add deposit and withdrawal information to transcation_history' do
    expect(@account.statement).to eq ['10/01/2023 || 1000.00 || || 1000.00']
  end

  it 'should increase statement length by 1 when a deposit is made' do
    expect { @account.deposit(1000.00, '10-01-2023') }.to change { @account.statement.length }.by(1)
  end

  it 'should increase statement length by 1 when a withdrawal is made' do
    expect { @account.withdraw(1000.00, '10-01-2023') }.to change { @account.statement.length }.by(1)
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
    expect(@account.print_statement).to be
    ['date || credit || debit || balance',
     '14/01/2023 || || 500.00 || 2500.00',
     '13/01/2023 || 2000.00 || || 3000.00',
     '10/01/2023 || 1000.00 || || 1000.00']
  end
end
