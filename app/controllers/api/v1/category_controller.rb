module Api
    module V1
        class CategoryController < ApiController
    
            def index
                @catergories = Category.all
                render json: @catergories
            end

            def create
                category = Category.new(category_param)
                category.save  
                if category.save                
                    render json: category
                else
                    render json: {status: 0,error: @category.errors},status: :unprocessable_entity
                end
            end

            private
            def category_param
                params.permit(:name)
            end
        end
    end
end