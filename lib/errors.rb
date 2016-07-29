class DuplicateProductError < StandardError
	# puts something like LEGO Iron Man vs. Ultron already exists. (DuplicateProductError)
	# if products.map{|product| product.title}.include?(self.title)
	# 	puts "#{self.title} already exists."
end