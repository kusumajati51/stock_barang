# frozen_string_literal: true

module Api
  module V1
    class OrderController < ApiController
      before_action :authorize_access_request!

      def index
        @orders = Order.all
        render json: @orders
      end

      def create
        @items = current_user.items.find_by(id: params[:id])
        @sold = params.permit(:sold)
        @price = @items.price.to_i * @sold[:sold].to_i
        @order = current_user.order.new(sold: @sold[:sold].to_i, price: @price, item_id: params[:id])
        @stock = @items.stock - @sold[:sold].to_i
        @check_out = @items.check_out + @sold[:sold].to_i
        if(@sold[:sold].to_i < @items.stock)
          @items.update(check_out: @check_out, stock: @stock)
          if @order.save
            render json: @order
          else
            render json: { user: current_user,item: @items, error: @order.errors }
          end
        else
          render json: {error: "this item is not enough"}
        end
      end

      def multi_order
        @items = current_user.items
        @show_data ||= []
        @params = params[:_json].each do |c|
          item = @items.find_by(id: c[:id])
          sold = c[:sold].to_i
          price = item.price * sold
          stock = item.check_out - sold
          check_out = item.check_out + sold
          item.update(check_out: check_out, stock: stock)
          order = current_user.order.new(sold: sold, price: price, item_id: c[:id])
          order.save
          @show_data.push(item: item, order: order)

        end
        render json: @show_data
      end



      private

      def order_param
        params.permit(:sold, :price,:item_id)
      end

    end
  end
end