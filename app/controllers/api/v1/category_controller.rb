module Api
    module V1
        class CategoryController < ApiController
            before_action :authorize_access_request!

            def index
                @catergories = current_user.category.all
                render json: @catergories
            end

            def create
                category = current_user.category.new(category_param)
                category.save  
                if category.save                
                    render json: category
                else
                    render json: {status: 0,error: @category.errors},status: :unprocessable_entity
                end
            end

            private
            def category_param
                params.permit(:name, :attachment)
            end
        end
    end
end