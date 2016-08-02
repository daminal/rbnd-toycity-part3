class Customer
	attr_reader :name
	@@customers = []

	def initialize(options = {})
		@name = options[:name]
		add_to_customers
	end

	def add_to_customers
		begin					
			if @@customers.any?{|customer| customer.name == @name}
				raise DuplicateCustomerError.new
			else
				@@customers << self
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
		Transaction.new(self, product)
	end

	def cancel_transaction(id_num)
		Transaction.cancel_transaction(id_num)
	end
end
