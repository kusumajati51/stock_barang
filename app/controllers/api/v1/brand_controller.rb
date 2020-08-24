module Api 
    module V1
        class BrandController < ApiController
            before_action :authorize_access_request!

            def index
                @brands = current_user.brands.all
                render json: @brands
            end

            def create_brand
                @brand = current_user.brands.new(brand_param)
                if @brand.save
                    render json: @brand
                else
                    render json: @brand.errors, status: 442
                end
            end


            def multi_create_brand
                @params = multi_brand_param
                @check_errors =[]
                @brands = []
                @params.each_with_index do |p, index|
                    brand = current_user.brands.new(name: p[:name],company: p[:company])
                    check_error = {}
                    @brands.push(brand)
                    unless brand.valid?
                        brand.errors.each do |attribute, error|
                            check_error[attribute] = error
                            check_error[:index] = index
                            @check_errors.push(check_error)
                        end
                    end
                end
                unless @check_errors.empty? 
                    render json: @check_errors, status: 442
                else
                    @brands.each(&:save)
                    render json: @brands
                end
                # rescue NoMethodError => e
                #     render json: {error: "you're data is empty"}
                # render json: multi_brand_params
            end
            
            private
            def brand_param
                params.permit(:name, :company)
            end

            def multi_brand_param
                params.permit(_json: [:name, :company])
                params[:_json]
            end
        end
    end
end