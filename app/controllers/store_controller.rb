class StoreController < ApplicationController

  helper_method :current_user

  def index
    @categories = Category.all
    @items = Item.all
  end


  def user_logged_in
    user_logged_in?
  end

end
