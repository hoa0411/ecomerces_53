class CartsController < ApplicationController
  def create
    @product_id = params[:product_id]
    current_cart @product_id
    redirect_to show_carts_path
  end

  def current_cart product_id
    if session[:cart].present?
      if session[:cart].key?(product_id.to_s)
        session[:cart][product_id.to_s] += 1
      else
        session[:cart].store(product_id.to_s, 1)
      end
    else
      session[:cart] = {}
      session[:cart].store(product_id.to_s, 1)
    end
  end

  def show_cart
    @array = Product.where(id: session[:cart].keys)
  end

  def update_cart
    product_id = params[:product_id]
    qty = params[:quantity]
    session[:cart][product_id.to_s] = qty.to_i
    redirect_to show_carts_path
  end

  def delete_cart
    key = params[:product_id]
    session[:cart].delete(key.to_s)
    redirect_to show_carts_path
  end

  def destroy_cart
    session.delete(:cart)
  end
end
