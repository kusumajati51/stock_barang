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
          @total = 0;
          @variant = @items.variant_sizes.find_by(id: params[:variant_id])
          @sold = params[:sold]
          @price = @variant.sell_price_cents.to_i * @sold.to_i
          total_pieces = @variant.qty_size.to_i * @sold.to_i
          @total += @price
          @transaction = current_user.sales_invoices.build(transaction_type: 1)
          order = Order.new(sold: @sold, order_price_cents: @total , variant_size_id: @variant.id, total_pieces: total_pieces)
          @transaction.total_transaction_cents = @total
          @transaction.orders << order
          if @transaction.save
            render json: @transaction.orders
          else
            errors = {}
            @transaction.errors.each do |attr, msg|
              if(msg != "is invalid")
                errors[attr] = msg
              end
            end
            render json: {error: errors, price: @price}
          end
      end

      def multi_order
        @check_errors = []
        @items = current_user.items
        @param = multi_order_param
        @orders = []
        @total = 0;
        @transactions = current_user.sales_invoices.build(transaction_type: 1)
        @param.each do |p|
          variant_size = VariantSize.find(p[:variant_id])
          sold = p[:sold]
          price = variant_size.sell_price.to_i * sold.to_i 
          @total += price
          total_pieces = variant_size.qty_size.to_i * sold.to_i
          order = Order.new(sold: sold, order_price_cents: price, variant_size_id: variant_size.id, total_pieces: total_pieces)
          @transactions.orders << order
        end
        @transactions.total_transaction_cents = @total
        puts(@total)
        if @transactions.save
          render json: @transactions.orders
        else
          @transactions.orders.each_with_index do | order, index|
              check_valid = {}
              order.errors.each do |attr, msg|
                check_valid[attr] = msg
              end
              check_valid[:index] = index
              unless order.valid?
                @check_errors.push(check_valid)
              end 
            end
          render json: @check_errors, status: 442
        end
      end 



      private

      def multi_order_param
         params.permit(_json: [:sold, :variant_id])
         params[:_json]
      end

    end
  end
end