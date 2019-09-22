module Api
    module V1
        class ProductController < ApiController
            before_action :authorize_access_request!

            def index
                @products = current_user.product.all    
                @item ||= []
                @products.each do |product|
                    data = {name: product.name,
                        price: product.price, 
                        url: product.product_picture.url}
                    @item.push(data)
                end
                render json: @item
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
                params.permit( :name, :price, :category_id, :check_in, :product_picture)
            end
        end
    end
end