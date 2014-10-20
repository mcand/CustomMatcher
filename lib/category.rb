class Category
	attr_reader :subcategories
	attr_reader :name

	def initialize(name)
		@name = name
		@subcategories = []
	end

	def add_subcategories(*subcategories)
		#TODO
	end
end
