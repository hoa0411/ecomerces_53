class OrdersController < ApplicationController
  load_and_authorize_resource
  def show
    @user = User.find_by id: session[:user_id]
    if @user.present?
      @orders = @user.orders
    end
      flash[:danger] = t "controllers.order.show.danger"
      redirect_to root_path
  end
end
