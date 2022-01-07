# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:deposit_double_1) { double :deposit_double_1, :credit => 1000, :debit => nil, :date => '10-01-2023', :balance => 1000 }
  let(:deposit_double_2) { double :deposit_double_2, :credit => 2000, :debit => nil, :date => '13-01-2023', :balance => 3000 }
  let(:withdrawal_double) { double :withdrawal_double, :credit => nil, :debit => 500, :date => '14-01-2023', :balance => 2500 }

  describe '#print_statement' do
    before do
      @statement = Statement.new
    end

    it 'should return information about all transactions made on the account with headers' do
      expect(@statement.print_statement).to be
      ['date || credit || debit || balance',
      '14/01/2023 || || 500.00 || 2500.00',
      '13/01/2023 || 2000.00 || || 3000.00',
      '10/01/2023 || 1000.00 || || 1000.00']
    end
  end
  
  describe '#convert_to_float' do
    it 'should take an integer and convert to float with two trailing 0s' do
      account.deposit(deposit_double_1.credit, deposit_double_1.date)
      expect(statement.balance).to be_a(Float)
    end
  end
end
