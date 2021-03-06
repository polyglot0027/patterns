class Account
  attr_accessor :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def <=>(other)
    balance <=> other.balance
  end
end

class Portfolio
  include Enumerable

  def initialize
    @accounts = []
  end

  def each(&block)
    @accounts.each(&block)
  end

  def add_account(account)
    @accounts << account
  end
end

my_portfolio =  Portfolio.new
my_portfolio.add_account(Account.new('Bonds', 200))
my_portfolio.add_account(Account.new('Stocks', 100))
my_portfolio.add_account(Account.new('Real Estate', 1000))

my_portfolio.any? { |account| account.balance > 2000 }
my_portfolio.all? { |account| account.balance >= 10 }
my_portfolio.each { |account| puts "#{account.name}: #{account.balance}" }
my_portfolio.map { |account| account.balance }
my_portfolio.max
my_portfolio.min
