class Customer
	attr_reader :name
	@@customers = []

	def initialize(options = {})
		@name = options[:name]
		add_to_customers
	end

	def add_to_customers
		if @@customers.any?{|customer| customer.name == @name}
			raise DuplicateCustomerError.new, "DuplicateCustomerError: \'#{@name}\' already exists."
		else
			@@customers << self
		end		
	end

	def self.all
		@@customers
	end

	def self.find_by_name(name)
		@@customers.find{|customer| customer.name == name}
	end

	def purchase(name, product)
		Transaction.new(name, product)
	end
end

#options for finding out whether customers includes a particular name may include:
##include?(object), #find(object)...