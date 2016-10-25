class LineItemsController < ApplicationController

  def create
    @line_item = LineItem.new

    if !current_user.current_cart.nil?
      @line_item.item_id = params[:item_id]
      @line_item.cart_id = current_user.current_cart
      @line_item.save

      if !current_user.current_cart.line_items.select {|x| x.item_id.to_i == params[:item_id].to_i }.empty?
        multiple = current_user.current_cart.line_items.find_by(item_id: params[:item_id])
        multiple.quantity += 1
        multiple.save
        current_user.save
      else
        current_user.current_cart.line_items << @line_item
        current_user.save
      end
    else
      current_user.create_current_cart
      @line_item.item_id = params[:item_id]
      @line_item.cart_id = current_user.current_cart
      current_user.current_cart.line_items << @line_item
      current_user.save
    end

    flash[:notice] = "You've added #{Item.find_by_id(params[:item_id]).title} to your cart!"
    redirect_to cart_path(current_user.current_cart)
  end


end
