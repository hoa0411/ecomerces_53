class OrderDetailsController < ApplicationController
  def create
    if session[:user_id].present?
      user_id = session[:user_id]
      order = Order.create(user: user_id)
    else
      flash[:danger]= "Please login"
      redirect_to root_path
    end
  end
end
