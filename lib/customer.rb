  class Customer
  attr_reader :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_customer
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
      @@customers.each {|cust| return cust if cust.name == name}
  end

  def purchase(product)
    title = product.title
    if product.in_stock? == true
      new_purchasae = Transaction.new(@name, product)
    else
      raise OutOfStockError, "#{title} is out of stock."
    end
  end

  private

  def add_customer
    @@customers.each {|cust| raise DuplicateCustomerError, "#{@name} already exists." if
    cust.name == @name}
    @@customers << self
  end
end
