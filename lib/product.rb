class Product
  attr_reader :title, :price
  attr_accessor :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def in_stock?
    @stock > 0
  end

  def self.in_stock
    @@products.select{|product| product.in_stock?}
  end

  def self.all
    @@products
  end

  private

  def add_to_products
    begin
      if @@products.any?{|product| product.title == @title}
        raise DuplicateProductError.new, "'#{@title}' already exists."
      else
        @@products << self
      end
    end
    rescue StandardError => e 
      puts "#{e.class}: #{e.message}"
  end
  

  def self.find_by_title(title_to_search)
    @@products.find{|product| product.title == title_to_search}
  end
end