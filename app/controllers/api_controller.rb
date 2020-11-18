class ApiController < ActionController::API
    include JWTSessions::RailsAuthorization
    rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
    rescue_from AbstractController::ActionNotFound, with: :wrong_route
    

    def referencing_transaction
        array = []
        order = { type: 1, type_name: "order"}
        order = { type: 2, type_name: "get_items"}
        array.push(order)
        render json: array
    end    

    private 
    def current_user
        @current_user ||= User.find(payload['user_id'])
        
    end

    def not_authorized
        render json: { status: 0, error: "Not authorized" }, status: 401

    end

    def wrong_route
        render json: {error: "Not found function"}, status: 300


    end
end