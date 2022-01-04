# frozen_string_literal: true

require 'account'

describe 'account' do
  before do
    @account = Account.new
  end

  it 'starts with a balance of 0' do
    expect(@account.balance).to eq 0
  end

  it 'should increase balance when #deposit is called with an amount' do
    @account.deposit(1000)
    expect(@account.balance).to eq 1000
  end
end
