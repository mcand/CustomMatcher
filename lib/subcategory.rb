class Subcategory
	attr_reader :products

	def initialize(name)
		@name = name
		@products = []
	end

	def add_product(product)
		@products << product
	end
end
