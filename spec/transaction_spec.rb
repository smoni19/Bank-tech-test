# frozen_string_literal: true

require 'transaction'

describe '#deposit' do
  before do
    @account = Account.new
    @account.deposit(1000.00, '10-01-2023')
  end

  it 'should increase statement length by 1 when a deposit is made' do
    @account.deposit(1000.00, '10-01-2023')
    expect { @account.deposit(1000.00, '10-01-2023') }.to change { @account.account_statement.statement.length }.by(1)
  end

  it 'should increase statement length by 1 when a withdrawal is made' do
    @account.deposit(1000.00, '10-01-2023')
    expect { @account.withdraw(1000.00, '10-01-2023') }.to change { @account.account_statement.statement.length }.by(1)
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
