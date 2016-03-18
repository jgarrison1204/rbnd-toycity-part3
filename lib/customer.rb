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
      @@customers.each do |cust|
      search = cust.name.include? name
      if search == true
        return cust
      end
    end
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
    @@customers.each do |cust|
      dup_cust = cust.name.include? @name
      if dup_cust == true
        raise DuplicateCustomerError, "#{@name} already exists."
      end
    end
    @@customers << self
  end
end
