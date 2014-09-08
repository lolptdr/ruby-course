class OrdersController < ApplicationController
  def index
    @orders = DoubleDog.db.all_orders
    @items = DoubleDog.db.all_items
  end
 
  def create
    tx_params = { session_id: $session_id }
    tx_params[:items] = order_params[:item_ids].map! do |id|
      DoubleDog.db.get_item(id.to_i)
    end
 
    result = DoubleDog::CreateOrder.new.run(tx_params)
    
    if result[:success?]
      redirect_to orders_path
    else
      @error = result[:error]
      render 'index'
    end
  end
 
  private
 
  def order_params
    params.require(:order).permit(item_ids: [])
  end
end