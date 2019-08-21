module Api
  module V1


class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    # @orders = Order.all

    if params[:customer_id].present?
      @orders = Order.where(customer_id: params[:customer_id])
    else
      @orders = Order.all        
    end

    render json: @orders

  end

  # GET /orders/1
  def show
    @order = Order.find(params[:id])

    render json: @order
  end

  # POST /orders
  def create
    @order= Order.new(customer_id: order_params[:customer_id])
    @order[:status] = "pending"

    if @order.save
      render json: @order
    else
      render json: @order.errors
    end
  end

  

  def ship
    @order = Order.find(params[:id])
    puts @order
    @order[:status] = "shipped"

    render json: @order
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:status, :customer_id)
    end
end


end
end
