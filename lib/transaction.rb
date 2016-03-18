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

  #why won't include? work on fixnum in this case.  Need to convert to string.
  def self.find(id)
    @@transactions.each do |find|
      search = find.id.to_s.include? id.to_s
      if search == true
        return find
      end
    end
  end

  #New function.  Returns the most recent transaction for a customer
  def self.find_by_name(name)
    @@transactions.reverse.each do |find|
      search = find.customer.to_s.include? name
      if search == true
        return puts "The last product #{find.customer} purchased was #{find.product.title}"
      end
    end
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
