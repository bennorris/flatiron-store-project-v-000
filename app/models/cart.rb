class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user


  def total
    total = 0

    self.line_items.each do |item|
      quant = item.quantity * Item.find_by_id(item.item_id).price
      total+=quant
    end
    total
  end

  def add_item(item)
    new_item = LineItem.find_by(item_id: item, cart_id: self.id)
 		if new_item
 				new_item.quantity += 1
 				new_item.save
 				new_item
 		else
 			line_items.build(:item_id => item)
 		end
  end

end
