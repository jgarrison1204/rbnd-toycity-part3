class Product
  attr_reader :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_product
  end


  def self.all
    @@products
  end

  def self.find_by_title(stuff)
    @@products.each do |find|
      search = find.title.include? stuff
      if search == true
        return find
      end
    end
  end

  def in_stock?
    @stock > 0
  end

  def self.in_stock
    @@products.select {|has_stock| has_stock.in_stock?}
  end

  private

  def add_product
    @@products.each do |dup|
      duplicate = dup.title.include? @title
      if duplicate == true
        raise DuplicateProductError, "#{@title} already exists."
      end
    end
    @@products << self
  end
end
