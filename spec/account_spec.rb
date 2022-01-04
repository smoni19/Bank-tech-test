# frozen_string_literal: true

require 'account'

describe Account do
  before do
    @account = Account.new
  end

  it 'starts with a balance of 0' do
    expect(@account.balance).to eq 0
  end

  it 'should start with an empty transaction_history' do
    expect(@account.transaction_history.length).to eq 0
  end
end

describe '#deposit' do
  before do
    @account = Account.new
  end

  it 'should increase transaction_history length by 1 when a deposit is made' do
    @account.deposit(1000, '10-01-2023')
    expect(@account.transaction_history.length).to eq 1
  end

  it 'generates a transaction string when a deposit is made' do
    @account.deposit(1000, '10-01-2023')
    expect(@account.transaction).to eq "10-01-2023 || 1000 || || 1000"
  end

  it 'should take an amount and date argument and increase balance' do
    @account.deposit(1000, '10-01-2023')
    @account.deposit(2000, '13-01-2023')
    expect(@account.balance).to eq 3000
  end
end

describe '#withdraw' do
  before do
    @account = Account.new
    @account.deposit(1000, '10-01-2023')
  end

  it 'should increase transaction_history length by 1 when a withdrawal is made' do
    @account.withdraw(1000, '10-01-2023')
    expect(@account.transaction_history.length).to eq 2
  end

  it 'generates a transaction string when a withdrawal is made' do
    @account.withdraw(1000, '10-01-2023')
    expect(@account.transaction).to eq "10-01-2023 || || 1000 || 0"
  end

  it 'should take an amount and date argument and increase balance' do
    @account.withdraw(1000, '10-01-2023')
    expect(@account.balance).to eq 0
  end
end