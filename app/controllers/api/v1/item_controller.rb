module Api
  module V1
    class ItemController < ApiController
      before_action :authorize_access_request!

      def index
        @products = current_user.items.all
        @item ||= []
        @products.each do |product|
          data = { name: product.name_items,
                   price: product.price,
                   url: product.product_picture.url }
          @item.push(data)
        end
        render json: @products
      end

      def create
        @product = current_user.items.new(product_param)
        if @product.save
          render json: @product
        else
          render json: { error: @product.errors }
        end
      end

        private 

      def product_param
        params.permit( :name_items, :price, :category_id, :check_in, :product_picture)
      end
    end
  end
end