require "spec_helper"
require "category"
require "subcategory"

RSpec::Matchers.define :contain_products do |*products|
	match do |category|
		subcategories_products = category.subcategories.map{|sub| sub.products}
		subcategories_products.flatten!

		expect(subcategories_products & products).to eq products
	end

	failure_message do |category|
		"expected category #{category.name} to contain products #{products}"
	end
end

describe Category do
	it "contains all the products of its subcategories" do
		eletronics = Category.new("eletronics")
		computers = Subcategory.new("computers")
		cell_phones = Subcategory.new("cell phones")
		computers.add_product("MacBook")
		cell_phones.add_product("iPhone")

		eletronics.add_subcategories(computers, cell_phones)

		expect(eletronics).to contain_products("MacBook", "iPhone")
	end
end
