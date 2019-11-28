class ApiController < ActionController::API
    include JWTSessions::RailsAuthorization
    rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
    rescue_from AbstractController::ActionNotFound, with: :wrong_route
    
    private 
    def current_user
        @current_user ||= User.find(payload['user_id'])
        
    end

    def not_authorized
        render json: { status: 0, error: "Not authorized" }
        
    end

    def wrong_route
        render json: {error: "Not found function"}
    end
end