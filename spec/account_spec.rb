require 'account'

describe 'account' do
  it 'starts with a balance of 0' do
    account = Account.new
    expect(account.new).to eq 0
  end
end