# frozen_string_literal: true

require 'account'

describe Account do
  before do
    @account = Account.new
  end

  it 'starts with a balance of 0' do
    expect(@account.balance).to eq 0
  end
end
