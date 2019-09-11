module Api
    module V1
        class CategoryController < ApiController
    
            def index
                @catergories = Category.all
                render json: @catergories
            end

            def create
                @catergory = Category.new(category_param)
                if @category.save                
                    render json: @catergory
                else
                    render json: {status: 0,error: @category.errors},status: :unprocessable_entity
                end
            end

            private
            def category_param
                params.require(:category).permit(:name)
            end
        end
    end
end