class Transaction
	attr_accessor :product, :customer, :id, :shipment_processed
	@@transactions = []

	def initialize(customer, product)
		@customer = customer
		@product = product
		@id = @@transactions.count.next
		add_to_transactions
		@shipment_processed = false
	end

	def add_to_transactions
		begin 
			if @product.in_stock?
				@@transactions << self	
				@product.stock -= 1
			else
				raise OutOfStockError.new
			end
		end
		rescue 
			puts "OutOfStockError: \'#{product.title}\' is out of stock."
	end

	def process_shipment
		@shipment_processed = true
	end
 
	def self.print_purchases
		puts "Purchases"
		@@transactions.each do |p| 
			puts "#{p.id}. Customer: #{p.customer.name}\tProduct: #{p.product.title} \tProcessed? #{p.shipment_processed}"
		end

	end	

	def self.all
		@@transactions
	end

	def self.find(id)
		@@transactions[id-1]
	end

end
# How do I access the contents of customer?
#Here, I need to access the product enumerable and diminish its instance variable 
#@stock by 1. 