module Api
    module V1
        class CategoryController < ApiController
            before_action :authorize_access_request!, only: [:index, :spinner_category, :create]

            def index
                @catergories = current_user.categories.all
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
                @catergories = current_user.categories.all
                @catergoryData ||=[]
                @brandData ||= []
                @catergories.each do |category|
                    data = {id: category.id ,name: category.name_category, pictures: category.attachment.url}
                    @catergoryData.push(data)
                end
                @brands = current_user.brands
                @brands.each do |brand|
                    dataBrand = {id: brand.id ,name: brand.name}
                    @brandData.push(dataBrand)
                end
                @response = {status: 1, category: @catergoryData, brand: @brandData}
                render json: @response
            end

            def liston
                @catergories = Category.all
                render json: @catergories
            end

            def create
                category = current_user.categories.new(category_param)
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
                params.permit(:name_category, :attachment)
            end
        end
    end
end