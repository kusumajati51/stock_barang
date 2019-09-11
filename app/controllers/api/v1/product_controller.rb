class ProductController < ApiController
     def index
        @products = current_user.product.all
        render json: @produsct
    end

    def create
       @product = current_user.product.build(product_param)
       render json: @product
    end

    private 

    def product_param
        params.require(:product).permit(:name, :price, :released_on, :category, :category_id)
    end
end