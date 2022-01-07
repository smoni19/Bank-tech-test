# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { Account.new }
  let(:deposit_double_1) { double :deposit_double_1, :credit => 1000, :debit => nil, :date => '10-01-2023', :balance => 1000 }
  let(:deposit_double_2) { double :deposit_double_2, :credit => 2000, :debit => nil, :date => '13-01-2023', :balance => 3000 }
  let(:withdrawal_double) { double :withdrawal_double, :credit => nil, :debit => 500, :date => '14-01-2023', :balance => 2500 }

  describe '#deposit' do
    it 'should increase statement length by 1 when a deposit is made' do
      expect { account.deposit(1000, '10-01-2023') }.to change { account.transactions.length }.by(1)
    end
  end

  describe '#withdraw' do
    it 'should raise an error if account will go below 0' do
      expect { account.withdraw(1000) }.to raise_error('You do not have enough money in your account!')
    end

    it 'should raise an error if anything but an integer is entered' do
      expect { account.withdraw('a') }.to raise_error('That is not a number!')
    end
  end
end
