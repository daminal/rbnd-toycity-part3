class Transaction
	attr_accessor :product, :customer, :id, :shipment_processed
	@@transactions = []

	def initialize(customer, product)
		@customer = customer
		@product = product
		if @@transactions.count > 0
			@id = @@transactions[-1].id.next
		else
			@id = 1
		end
		@shipment_processed = false
		add_to_transactions
	end

	def self.process_shipment(id_num)
		self.find(id_num).shipment_processed = true
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

	def self.find(id_num)
		@@transactions.find{|t| t.id == id_num}
	end

	def self.cancel_transaction(id_num)
		transaction = Transaction.find(id_num)
		unless transaction.shipment_processed
			@@transactions = @@transactions.reject{|t| t == transaction}
			puts "Order number #{id_num} has been canceled."
		else 
			raise ShipmentProcessedError.new
		end
		rescue 
			puts "ShipmentProcessedError: Order #{id_num} cannot be returned."
	end	

	private 
	
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
end