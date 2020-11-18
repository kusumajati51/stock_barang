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
          price = variant_size.sell_price_cents.to_i * sold.to_i 
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

      def show_dashboard
        @id = current_user.id
        sql_order = " SELECT COUNT(DATE_FORMAT(si.created_at, \"%d-%m-%Y\")) as create_count, 
                      DATE_FORMAT(si.created_at,  \"%d-%m-%Y\") as date_order,
                      SUM(o.order_price_cents) as total_price, 
                      SUM(o.sold) as total_sold
                      FROM sales_invoices si
                      JOIN orders o ON o.sales_invoice_id  = si.id
                      WHERE si.user_id = #{@id}
                      AND si.transaction_type = 1
                      GROUP BY DATE_FORMAT(si.created_at,  \"%d-%m-%Y\")"
        sql_order_items = "SELECT i.name_items,
                                  SUM(o.sold) as sold,
                                  SUM(o.order_price_cents) as sold_price 
                            FROM items i 
                            JOIN categories c ON c.id  = i.category_id
                            JOIN variant_sizes vs ON vs.item_id = i.id 
                            JOIN orders o ON o.variant_size_id  = vs.id 
                            WHERE c.user_id = #{@id}
                            GROUP BY i.id
                            HAVING COUNT(i.id)"              
        # sql_add_items = "select * from sales_invoices
        #                  join check_in_items on sales_invoice_id = sales_invoices.id
        #                  where user_id = #{@id}"
        # records_order = SalesInvoice.find_by_sql("select * from sales_invoices")
        query_dashborad = SalesInvoice.find_by_sql(sql_order)
        query_item_count = current_user.items.find_by_sql(sql_order_items)
        invoices = current_user.sales_invoices.where(transaction_type: 1)
        transaction_hisory = invoices.as_json(only: [:id, :transaction_code, :total_transaction_cents, :created_at],
          :include=>[:orders =>{:only=>[:id, :sold, :total_pieces, :created_at, :order_price_cent]}])
        dash_board = query_dashborad.as_json(only:[:total_price, :total_sold, :date_order])
        items_order = query_item_count.as_json(only: %i[:name_items, sold, sold_price])
        # render json: invoices , include: [ :orders]
        render json: {status: 1,
                      messages: "Success",
                      data: {
                              dash_board: dash_board,
                              items_order: query_item_count,
                              transaction_hisory: transaction_hisory
                            }
                      }, status: 200
      end

      private

      def multi_order_param
         params.permit(_json: [:sold, :variant_id])
         params[:_json]
      end

    end
  end
end