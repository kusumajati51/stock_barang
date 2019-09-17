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
                if @product.save
                    render json: @product
                else
                    render json: { error: @product.errors }  
                end    
            end

            private 

            def product_param
                params.permit( :nama, :price, :category_id, :check_in, :product_picture)
            end
        end
    end
end