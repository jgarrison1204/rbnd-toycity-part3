class Transaction

  attr_reader :customer, :product, :id

  @@id = 0
  @@transactions = []

  def initialize(customer, product)
    @customer = customer
    @product = product
    decrement_stock_from_product
  end

  def self.all
    @@transactions
  end

  def self.find(idd)
    @@transactions.each do |find|
      puts "ID NUMBER: #{find.id}"
    end
  end

private

  def decrement_stock_from_product
    @product.decrement_stock
    add_transaction_number
  end

  def add_transaction_number
    @id = @@id
    @id += 1
    @@transactions << self
  end
end
