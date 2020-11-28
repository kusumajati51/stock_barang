module Api
  module V1
    class InventoryController < ApiController
        before_action :authorize_access_request!

        def create_inventory
          @param = param_inventory
          @variants = VariantSize.find(@param[:variant_size_id])
          @item = current_user.items.find(@variants.item_id)
          @transaction = current_user.sales_invoices.build(transaction_type: 2)
          total =@param[:buy_price_cents].to_i * @param[:total_item].to_i
          total_pieces = @variants.qty_size.to_i * @param[:total_item].to_i
          @transaction.check_in_items.new(total_item: @param[:total_item], buy_price_cents: @param[:buy_price_cents], 
            variant_size_id: @variants.id, total_pieces: total_pieces)
          @transaction.total_transaction_cents = total
          @transaction.save
          render json: { status: 1, message: "Success add inventory", data: @transaction}
        rescue ActiveRecord::RecordNotSaved => e
          render json: { status: 0 ,message: e.to_s}, status: 422
        rescue ActiveRecord::RecordNotFound => e
          render json: { status: 0 ,message: e.to_s}, status: 422
        end

        def get_data_variant
          @items = current_user.items.find(params[:id])
          @variants = @items.variant_sizes
          render json: @variants
        end

        def create_variant_name
          @param = param_variant[:variant_size]
          @check_errors = {}
          @param.each_with_index do |p, index|
              variant = VariantSize.new(p)
              if !variant.valid?
                variant.errors.each do |attribute, error|
                  @check_errors[attribute] = error
                  @check_errors[:index] = index
                end
              end
          end
          if !@check_errors.empty?
            render json: @check_errors, status: 422
          else
            @variants = VariantSize.create param_variant[:variant_size]

            if @variants.all? {|variant| 
              variant.persisted?
            }
              render json: @variants
            else
              @errors = {}
              @variants.map { |variant| variant.errors.each do |attribute, error|
                  @errors[attribute] = error
              end
              }
              render json: @errors
            end
          end
        end
        
        def dashboard_item_in
          
        end
        

        private
          def param_variant
            #  params.require(:variant_size).permit(:variant_name, :sell_price, :buy_price, :qty_size, :item_id)
             params.permit(variant_size: [:variant_name, :sell_price_cents, :qty_size,:item_id])
          end

          def param_inventory
            params.permit(:total_item, :variant_size_id, :buy_price_cents)
          end

    end
  end
end