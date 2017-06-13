# spec/bank_account_spec.rb

require "./bank_account"

describe BankAccount do
  context "has a balance" do
    it "is created with an opening balance and the name of the client" do
      account = BankAccount.new(500, "Sarah")
      expect(account).to be_a(BankAccount)
    end
  end

  context "has a balance" do
  it "can report it's balance" do
    account = BankAccount.new(500, "Sarah")
    expect(account.balance).to eq(500)
  end
end

    it "is created with an opening balance and the name of the client"
    it "can report it's balance"

  context "making a deposit" do
    it "balance is increased" do
      account = BankAccount.new(500, "Sarah")
      account.deposit(500)
      expect(account.balance).to eq(1000)
    end
  end

  context "making a withdrawal" do
    it "balance is decreased" do
      account = BankAccount.new(500, "Sarah")
      account.withdraw(200)
      expect(account.balance).to eq(300)
    end
  end

  context "transfering funds" do
    let(:account) do
      account = BankAccount.new(500, "Sarah")
    end

    let(:other_account) do
      other_account = BankAccount.new(1000, "Todd")
    end

    before :each do
      account.transfer(200, other_account)
    end

    it "account balance is decreased" do
      expect(account.balance).to eq(300)
    end

    it "other account balance is increased" do
      expect(other_account.balance).to eq(1200)
    end
  end

  context "minimum balance"
    it "raises an error if opening balance is too low" do
  expect { BankAccount.new(100, "Sarah") }.to raise_error(ArgumentError)
end

    it "does NOT raise an error if opening balance is over minimum balance" do
      expect{ BankAccount.new(201, "Terry") }.not_to raise_error
    end

    it "allows the bank owner to change the minimum balance" do
      BankAccount.minimum_balance(100)
      expect(BankAccount.minimum_balance).to eq(100)
  end
end
