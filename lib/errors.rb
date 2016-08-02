class DuplicateProductError < StandardError
end

class DuplicateCustomerError < StandardError
end

class OutOfStockError < StandardError
end

#OK, so here's what I need to know. Do I put the condition for the error being thrown
#in the error method or in the methods calling it. Also, what is the code in the error
#for? Can I use it to generate a message? Maybe I need to experiment with it to fined
#out what happens when I call the error. 

