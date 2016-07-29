class Customer
	attr_accessor :name
	@@customers = []

	def initialize(options = {})
		@name = options[:name]
		add_to_customers
	end

	def add_to_customers
		#how do this error thing?
		@@customers << self		
	end

	def self.all
		@@customers
	end

	def self.find_by_name(name)
		@@customers.find{|customer| customer.name == name}
	end

end