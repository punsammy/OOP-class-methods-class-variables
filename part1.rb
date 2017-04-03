class BankAccount

  @@interest_rate = 0.05

  @@accounts = []

  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def self.create
    new_account = BankAccount.new
    @@accounts << new_account
    return account
  end

  def self.total_funds
    total = 0
    @@account.each do |account|
      total = total + account.balance
    end
    return total
  end

  def self.interest_time
    @@account.each do |account|
      @balance = @balance + (@balance*@@interest_rate)
    end
    return @balance
  end

  def deposit(amount)
    @balance = @balance + amount
  end

  def withdraw(amount)
    @balance = @balance - amount
  end
end

amandasaccount = BankAccount.new
puts amandasaccount.inspect
puts amandasaccount.deposit(200)
puts amandasaccount.balance
puts amandasaccount.total_funds
