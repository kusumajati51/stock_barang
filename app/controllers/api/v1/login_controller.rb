module Api
    module V1
        class LoginController < ApiController
            
            def create 
                user = User.find_by!(email: params[:email])
                if user.authenticate(params[:password])
                    payload = {user_id: user.id}
                    session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
                    tokens = session.login
                    response.set_cookie(JWTSessions.access_cookie,
                        value: tokens[:acces],httponly: true, secure: Rails.env.production?)
                    data_login =  {token: tokens[:access], nama: user.name, email: user.email, no_hp: user.no_hp}
                    render json: {status: 1,message: "Berhasil Mendaftar" ,data: data_login}
                else
                    render json: { error: user.errors }, status: :not_found
                end
            end

        end

         private

        def not_found
            render json: { error: "Cannot find email/password combination" }, status: :not_found
        end
    end
end