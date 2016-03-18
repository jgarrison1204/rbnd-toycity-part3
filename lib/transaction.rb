class Transaction

  attr_reader :customer, :product, :id

  @@id = 1
  @@transactions = []

  def initialize(customer, product)
    @customer = customer
    @product = product
    decrement_stock_from_product
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.each {|find| return find if find.id == id}
  end

  #New function. Returns the most recent transaction for a customer
  def self.find_by_name(name)
    @@transactions.reverse.each {|find| return "The last product #{find.customer} purchased was #{find.product.title}" if find.customer == name}
  end

private

  def decrement_stock_from_product
    @product.decrement_stock
    add_transaction_number
  end

  def add_transaction_number
    @id = @@id
    @@id += 1
    @@transactions << self
  end
end
