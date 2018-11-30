class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :maillot

  def total
  	maillot.price * quantity
  end
end
