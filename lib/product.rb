class Product
  attr_reader :title, :price, :stock, :item_id

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    @item_id = options[:item_id]
    add_product
  end

  def self.all
    @@products
  end

  def self.find_by_title(title)
    @@products.each {|find| return find if find.title == title}
  end

  def in_stock?
    @stock > 0
  end

  def decrement_stock
    @stock -= 1
  end

  def self.in_stock
    @@products.select {|has_stock| has_stock.in_stock?}
  end

  private

  def add_product
    @@products.each {|dup| raise DuplicateProductError, "#{title} already exists!" if dup.title == @title}
    @@products << self
  end
end
