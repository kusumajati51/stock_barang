module Api
  module V1
    class ItemController < ApiController
      before_action :authorize_access_request!

      def index
        @products = current_user.items.all
        @item ||= []
        @products.each do |product|
          inventory = product.inventory
          data_invetory = { stock: inventory.stock,
                            check_in: inventory.check_in}
          data = { name: product.name_items,
                   url: product.product_picture.url,
                   inventory: data_invetory }
          @item.push(data)
        end
        render json: {status: 1, data: @item}
      end

      def show
        @item = current_user.items.find(params[:id])
        @items = Inventory.joins(:item).where("inventories.item_id", @item.id)
        @e = Item.joins(:inventory).merge(@items).includes(:inventory)
        render json: @e
      end

      def create
        @item = current_user.items.new(product_param)
        if @item.save
          @variant = @item.variant_sizes.new(param_variant)
          if@variant.save
            @inventory = @item.create_inventory
            if(@inventory.save)
              @minimum = MinimumSize.create!(inventory: @inventory, variant_size: @variant)
              if @minimum.save
                data_invetory = {stock: @inventory.stock,
                                 check_in: @inventory.check_in}
                data_variant = { variant_name: @variant.variant_name, 
                                 buy_price: @variant.buy_price,
                                 sell_price: @variant.sell_price,
                                 qty_size: @variant.qty_size}
                data = { name: @item.name_items,
                   url: @item.product_picture.url,
                   minimum_variant_sizes: data_variant,
                   inventory: data_invetory } 
                render json: {status: 1, data: data}
              else
                render json: @minimum.errors
              end
            end
          else
            render json: @variant.errors
          end          
        else
          render json: { error: @item.errors }
        end
      end

      private

      def product_param
        params.permit(:name_items, :category_id, :product_picture, :brand_id)
      end

      def param_variant
        params.permit(:variant_name, :sell_price, :buy_price, :qty_size)
      end

      def param_inventory
        params.permit(:stock, :check_in)
      end

    end
  end
end