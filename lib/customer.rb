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
		begin 
			if product.in_stock?
				Transaction.new(@name, product)
			else
				raise OutOfStockError.new
			end
		end
		rescue 
			puts "OutOfStockError: \'#{product.title}\' is out of stock."
	end


end

#options for finding out whether customers includes a particular name may include:
##include?(object), #find(object)...