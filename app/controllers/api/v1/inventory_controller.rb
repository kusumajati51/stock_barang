module Api
  module V1
    class InventoryController < ApiController
        before_action :authorize_access_request!

        def create_inventory
          @item = current_user.items.find(param_inventory[:item_id])
          render json: @item
        rescue ActiveRecord::RecordNotSaved => e
          render json: { status: 0 ,message: e.to_s}, status: 422
        end

        def create_variant_name
          @param = param_variant[:variant_size]
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

        private
          def param_variant
            #  params.require(:variant_size).permit(:variant_name, :sell_price, :buy_price, :qty_size, :item_id)
             params.permit(variant_size: [:variant_name, :sell_price, :buy_price, :qty_size,:item_id])
          end

          def param_inventory
            params.permit(:item_id, :stock, :check_in, :variant_size_id)
          end

        
    end
  end
end