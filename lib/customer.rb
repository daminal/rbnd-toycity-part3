class Customer
	attr_reader :name, :purchases
	@@customers = []

	def initialize(options = {})
		@name = options[:name]
		@purchases = []
		add_to_customers
	end

	def add_to_customers
		begin					
			unless @@customers.any?{|customer| customer.name == @name}
				@@customers << self
			else
				raise DuplicateCustomerError.new
		end
		rescue 
			puts "DuplicateCustomerError: \'#{@name}\' already exists."
		end		
	end

	def self.all
		@@customers
	end

	def self.find_by_name(name)
		@@customers.find{|customer| customer.name == name}
	end

	def purchase(product)
		#try to create new transaction: a purchase of a product by a customer.
		Transaction.new(@name, product)
		#if the transaction was added, add the purchase to the customer. 
		#@purchases << product
	end


end

#options for finding out whether customers includes a particular name may include:
##include?(object), #find(object)...