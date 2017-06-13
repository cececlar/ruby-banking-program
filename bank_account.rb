class BankAccount
  attr_accessor :balance

  @@minimum_balance = 200

  def self.minimum_balance(new_minimum=@@minimum_balance)
    @@minimum_balance = new_minimum
  end

  def initialize(balance, name)
    @balance = balance
    @name = name
    if @balance < @@minimum_balance
      Kernel.raise ArgumentError
    end
  end

def deposit(deposit_amount)
  @deposit_amount = deposit_amount
  @balance = @balance + @deposit_amount
end

def withdraw(withdraw_amount)
  @withdraw_amount = withdraw_amount
  @balance = @balance - @withdraw_amount
end

def transfer(amount, other_account)
  @transfer_amount = amount
  @other_account = other_account
  @balance = @balance - @transfer_amount
  @other_account.balance = @other_account.balance + @transfer_amount
end
end
