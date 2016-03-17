class Product
  attr_reader :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_product
  end

  def in_stock?
    #todo
  end

  def self.all
    @@products
  end

  #Overwrites the to_s in puts when printing @title
  def to_s
    "#{@title} #{@price} #{@stock}"
  end

  def self.find_by_title(stuff)
    #todo
    @@products.each do |find|
      [find].include? stuff
  end

  def self.in_stock
    #todo
  end

  private

  def add_product
    @@products << self
    #@@products.each do |title|
      #puts [title].something.include? @title
    #end
  end
end
