class Product
  attr_reader :title, :price, :stock

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
    @@products.find_all{|product| product.stock > 0}
  end

  def self.all
    @@products  #call this from outside function: Products.all.
  end

  private

  def add_to_products
    #if the title of an item in products hash is equal to this title, then throw error.
    @@products << self
  end
  def self.find_by_title(title_to_search)
    @@products.find{|product| product.title == title_to_search}
  end
end



#It looks like there are 2 ways to do this. I could use map with eql?(other)
#I think I should use each_pair.eql(). 
#I want to go through each product. I check if :title = the input title. If it does,
#I return the ID. 