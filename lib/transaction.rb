class Transaction
	attr_accessor :product, :customer, :id
	@@transactions = []

	def initialize(name, product)
		@customer = name
		@product = product
		@id = @@transactions.count.next
		add_to_transactions
	end

	def add_to_transactions
		#how do this error thing?
		@@transactions << self	
		@product.stock -= 1
	end

	def self.all
		@@transactions
	end

	def self.find(id)
		@@transactions[id-1]
	end

end

#Here, I need to access the product enumerable and diminish its instance variable 
#@stock by 1. 