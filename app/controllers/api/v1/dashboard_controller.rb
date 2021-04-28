module Api
    module V1
        class DashboardController < ApiController
            before_action :authorize_access_request!
      
            def show_dashboard_order_list
                @sales_invoices = current_user.sales_invoices
                @r = @sales_invoices.select("sales_invoices.id ,sales_invoices.transaction_code ,
                    SUM(sales_invoices.total_transaction_cents) as total_income,
                    SUM(orders.total_pieces) as total_pieces")
                    .joins("JOIN orders ON orders.sales_invoice_id = sales_invoices.id")
                    .joins("JOIN variant_sizes ON orders.variant_size_id = variant_sizes.id")
                    .group('orders.sales_invoice_id')
                render json: {status: 1 ,data: @r}
            end

            def show_dashboard_order_sell
                @sales_invoices = current_user.sales_invoices
                @r = @sales_invoices.select("items.id,items.name_items, variant_sizes.variant_name,
                    SUM(orders.order_price_cents) as price,
                    SUM(orders.total_pieces) as pieces,
                    SUM(orders.sold) as total_sold")
                    .joins(:orders)
                    .joins("JOIN variant_sizes ON orders.variant_size_id = variant_sizes.id")
                    .joins("JOIN items ON items.id = variant_sizes.item_id")
                    .group('orders.variant_size_id')
                render json: {status: 1 ,data: @r}
            end
 
            def show_dashboard_show_transaction
                @sales_invoices = current_user.sales_invoices
                @r = @sales_invoices.select("SUM(sales_invoices.total_transaction_cents) as transactions,
                    DATE_FORMAT(sales_invoices.created_at, '%Y/%M/%d') as date")
                    .group('date')
                render json: {status: 1 ,data: @r}
            end
        end
    end
end 