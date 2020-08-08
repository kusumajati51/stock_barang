module Api
  module V1
    class InventoryController < ApiController
        before_action :authorize_access_request!

        def create_inventory
          @item = current_user.items.find(param_inventory[:item_id])
          @variant = @item.variant_sizes.find(param_inventory[:variant_size_id])
          # render json: @variant
          @param = {}
          @response  = JSON.parse('{"status": "1"}')
          @param[:item_id] = param_inventory[:item_id]
          @param[:stock] = param_inventory[:stock]
          @param[:check_in] = param_inventory[:check_in]
          @inventory = @item.create_inventory(@param)
          if @inventory.save
            puts @response["data"] => @inventory.to_json
            @minimum = MinimumSize.create!(inventory: @inventory, variant_size: @variant)
            if@minimum.save
              render json: @inventory.to_json(:include => :minimum_sizes)
            else
              render json: { error: @minimum.errors, param:@param_minimun }, status: 400
            end
          else
            render json: { error: @inventory.errors }, status: 400
          end
        rescue ActiveRecord::RecordNotSaved => e
          render json: { status: 0 ,message: e.to_s}, status: 422
        end

        def create_variant_name
          @param = param_variant[:variant_size]
          @param.each do |p|
              variant = VariantSize.new(p)
              if !variant.valid?
                variant.errors.each do |attribute, error|
                  @check_errors[attribute] = error
                  @check_errors[:index] = @param.find_index(p)
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
            params.require(:inventory).permit(:item_id, :stock, :check_in, :variant_size_id)
          end

        
    end
  end
end