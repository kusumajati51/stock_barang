module Api
  module V1
    class ItemController < ApiController
      before_action :authorize_access_request!

      def index
        @products = current_user.items.all
        @item ||= []
        @products.each do |product|
          inventory = product.inventory
          data = { id:   product.id,
                   name: product.name_items,
                   url: "http://#{request.host}:#{request.port}#{ + product.product_picture_url}",
                   check_in: inventory.check_in,
                   stock: inventory.stock,
                   check_out: inventory.check_out,
                   variant: product.variant_sizes }
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
        @param_i = param_inventory;
        @item = current_user.items.build(product_param)
        @variant = @item.variant_sizes.build(param_variant)
        @inventory = @item.build_inventory(param_inventory)
        @variant.inventories << @inventory
        if @item.save
          data_invetory = {stock: @inventory.stock, check_in: @inventory.check_in}
          data_variant = { variant_name: @variant.variant_name, sell_price_cents: @variant.sell_price_cents,
            qty_size: @variant.qty_size}
          data = { name: @item.name_items, url: @item.product_picture.url, minimum_variant_sizes: data_variant,
            inventory: data_invetory } 
          render json: {status: 1, data: data}
        else 
          data_eror = {}

          @item.errors.each do |attr, message|
            data_eror[attr] = "#{attr} #{message}"
          end
          @variant.errors.each do |attr, message|
            data_eror[attr] = "#{attr} #{message}"
          end
          @inventory.errors.each do |attr, message|
            data_eror[attr] = "#{attr} #{message}"
          end
          render json: {status: 0, data: data_eror}, status: 422
        end
      end

      private 

      def product_param
        params.permit(:name_items, :category_id, :product_picture, :brand_id)
      end

      def param_variant
        params.permit(:variant_name, :sell_price_cents, :qty_size)
      end

      def param_inventory
        params.permit(:check_in)
      end

    end
  end
end