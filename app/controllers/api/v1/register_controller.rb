module Api
  module V1
    class RegisterController < ApiController
      def create
        user = User.new(user_param)
        if user.save
          payload = {user_id: user.id}
          # , refresh_by_access_allowed: true
          session = JWTSessions::Session.new(payload: payload)
          tokens = session.login
          # response.set_cookie(JWTSessions.access_cookie, value: tokens[:acces],httponly: true,
          # secure: Rails.env.production?)
          data_login =  {token: tokens[:access], nama: user.name, email: user.email, no_hp: user.no_hp}
          render json: {status: 1,message: "Berhasil Mendaftar" ,data: data_login}
        else
          render json: {status: 0,error: user.errors},status: :unprocessable_entity
        end
      end

      private 

      def user_param
        params.permit(:email, :no_hp, :name, :password, :password_confirmation)
      end

    end 
  end
end