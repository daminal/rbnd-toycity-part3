class Customer
	attr_reader :name
	@@customers = []

	def initialize(options = {})
		@name = options[:name]
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
		Transaction.new(self, product)
		#if there is a return value from Transaction.new, then push to the @purchases.
		#if the transaction was added, add the purchase to the customer. 
		#@purchases << product
	end
end

# I want purchases to contain all the transaction IDs but don't know if I want to 
# have a redundant data structure. Not really sure how to handle this! Maybe with the 
# transaction id? 

#options for finding out whether customers includes a particular name may include:
##include?(object), #find(object)...