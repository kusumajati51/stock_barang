module Api
    module V1
        class ProductController < ApiController
            before_action :authorize_access_request!

            def index
                @products = current_user.product.all
                render json: @products
            end

            def create
            @product = current_user.product.new(product_param)
            @product.save
            render json: @product
            end

            private 

            def product_param
                params.require(:product).permit(:name, :price, :released_on, :category, :category_id)
            end
        end
    end
end