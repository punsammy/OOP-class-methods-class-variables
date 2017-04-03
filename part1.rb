class BankAccount


  attr_accessor :balance

  @@accounts = []
  @@interest_rate = 0.05

  def initialize
    @balance = 0
  end

  def self.create
    new_account = BankAccount.new
    @@accounts << new_account
    return new_account
  end

  def self.total_funds
    total = 0
    @@accounts.each do |account|
      total = total + account.balance
    end
    return total
  end

  def self.interest_time
    @@accounts.each do |account|
      account.balance += account.balance*@@interest_rate
    end
  end

  def deposit(amount)
    @balance = @balance + amount
  end

  def withdraw(amount)
    @balance = @balance - amount
  end
end

amanda = BankAccount.create
puts amanda.inspect
puts amanda.deposit(200)
puts amanda.balance
sean = BankAccount.create
puts sean.deposit(230)
puts sean.balance
puts BankAccount.total_funds
gurjant = BankAccount.create
puts gurjant.deposit(328432)
puts BankAccount.total_funds
BankAccount.interest_time
puts BankAccount.total_funds
puts sean.balance 
