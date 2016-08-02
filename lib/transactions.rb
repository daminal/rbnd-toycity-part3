	def cancel_purchase(id_number)
		transaction = @@transactions.select{|transaction| transaction[id] = id_number}
		begin 
			unless transaction[id-1].shipment_processed
				@@transactions.delete_at(id_number-1)
				@product.stock.next
			else
				raise ShipmentProcessedError.new
			end
		end
		rescue 
			puts "ShipmentProcessedError: Order id \'#{id}\' cannot be returned."
	end	

class ShipmentProcessedError
end

	notes on this commit: 
	transaction.rb: added self.print_purchases, :shipment_processed, and associated functions. customer.rb: fixed transaction.new func. app.rb: called new function.

