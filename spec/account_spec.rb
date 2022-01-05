# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { Account.new }
  let(:deposit_double_1) { double :deposit_double_1, :credit => 1000, :debit => '', :date => '10-01-2023', :balance => 1000 }
  let(:deposit_double_2) { double :deposit_double_2, :credit => 2000, :debit => '', :date => '13-01-2023', :balance => 3000 }
  let(:withdrawal_double) { double :withdrawal_double, :credit => '', :debit => 500, :date => '14-01-2023', :balance => 2500 }

  it 'starts with a balance of 0' do
    expect(account.balance).to eq 0
  end

  describe '#deposit' do
    it 'should increase statement length by 1 when a deposit is made' do
      expect { account.deposit(1000, '10-01-2023') }.to change { account.account_statement.statement.length }.by(1)
    end

    it 'should increase balance' do
      account.deposit(deposit_double_1.credit, deposit_double_1.date)
      account.deposit(deposit_double_2.credit, deposit_double_2.date)
      expect(account.balance).to eq 3000
    end
  end

  describe '#withdraw' do
    it 'should decrease balance' do
      account.deposit(deposit_double_2.credit, deposit_double_2.date)
      account.withdraw(withdrawal_double.debit, withdrawal_double.date)
      expect(account.balance).to eq 1500
    end

    it 'should raise an error if account will go below 0' do
      expect { account.withdraw(1000) }.to raise_error('You do not have enough money in your account!')
    end

    it 'should raise an error if anything but an integer is entered' do
      expect { account.withdraw('a') }.to raise_error('That is not a number!')
    end
  end
end
