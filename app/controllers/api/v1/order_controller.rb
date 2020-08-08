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
        @variant = @items.variant_sizes.find_by(id: params[:variant_id])
        @sold = params[:sold]
        @price = @variant.sell_price.to_i * @sold.to_i
        @order = @items.order.new(sold: @sold.to_i, price: @price)
        if @order.save
          render json: @order
        else
          render json: @order.errors
        end
        # unless(@sold.to_i > @inventory.stock)
        # else
        #   render json: {error: "this item is not enough"}
        # end

      end

      def multi_order
        @check_errors = []
        @items = current_user.items
        @param = multi_order_param
        @orders = []
        @param.each_with_index do |p, index|
           check_valid = {}
           item = @items.find(p[:id])
           variant_size = item.variant_sizes.find_by(id: p[:variant_id])
           sold = p[:sold]
           price = variant_size.sell_price.to_i - @sold.to_i
           order = item.order.new(sold: sold.to_i, price: price)
           @orders.push(order)
           unless order.valid?
              order.errors.each do |attribute, error|
                check_valid[attribute] = error
                check_valid[:index] = index
                @check_errors.push(check_valid)
              end
           end
        end
        unless @check_errors.empty?
          render json: @check_errors
        else
          @orders.each(&:save)
          render json: @orders
        end
      end



      private

      def order_param
        params.permit(:sold, :price,:item_id)
      end

      def multi_order_param
         params.permit(_json: [:sold, :variant_id,:item_id])
         params[:_json]
      end

    end
  end
end