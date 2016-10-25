class CartsController < ApplicationController

  def show
    @this_cart = current_user.current_cart
  end

  def update
    current_user.current_cart.line_items.each do |item|
      item_to_update = Item.find_by_id(item.item_id)
      item_to_update.inventory-=item.quantity
      item_to_update.save
    end

    current_user.current_cart = nil
    current_user.save
    flash[:notice] = "You successfully checked out!"
    redirect_to cart_path

  end

end
