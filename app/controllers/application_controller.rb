class ApplicationController < ActionController::Base
    rescue_from "ActionController::RoutingError", with: :wrong_route

    private
    
    def wrong_route
        render json: {error: "Not found function"}
    end    
end
