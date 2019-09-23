module Api
    module V1
        class CategoryController < ApiController
            before_action :authorize_access_request!

            def index
                @catergories = current_user.category.all
                @item ||=[]
                @catergories.each do |category|
                    data = {id: category.id ,name: category.name,
                    url_pict: category.attachment.url}
                @item.push(data)
                end
                @response = {status: 1, data: @item}
                render json: @response
            end

            def spinner_category 
                @catergories = current_user.category.all
                @item ||=[]
                @catergories.each do |category|
                    data = {id: category.id ,name: category.name}
                @item.push(data)
                
                end
                
                @response = {status: 1, data: @item}
                render json: @response
            end

            def create
                category = current_user.category.new(category_param)
                category.save  
                if category.save                
                    render json: category
                else
                    render json: {status: 0,error: @category.errors},status: :unprocessable_entity
                end
                rescue ActionController::BadRequest => e 
                   render json: {message: e.to_s}, status: :bad_request
            end

            private
            def category_param
                params.permit(:name,  :attachment)
            end
        end
    end
end