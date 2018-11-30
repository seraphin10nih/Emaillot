class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy

	def add_maillot(maillot)
		item = line_items.find_by(maillot: maillot)

		if item
			item.quantity += 1
		else
			item = line_items.new(maillot: maillot)
		end
		item
	end
	def total 
		line_items.to_a.sum(&:total)
	end
end
