# frozen_string_literal: true

module Api
  module V1
    class LoginController < ApiController
      def create
        if params[:email].nil? || params[:email].empty?
          render json: { message: 'email anda kosong' }
        else
          user = User.find_by!(email: params[:email])
          if user&.authenticate(params[:password])
            payload = { user_id: user.id }
            session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
            tokens = session.login
            response.set_cookie(JWTSessions.access_cookie,
                                value: tokens[:access], httponly: true, secure: Rails.env.production?)
            data_login = { token: tokens[:access], nama: user.name, email: user.email, no_hp: user.no_hp }
            render json: { status: 1, message: 'Berhasil Mendaftar', data: data_login }
          else
            not_found
          end
        end
      rescue ActiveRecord::RecordNotFound => e
        render json: { status: 0 ,message: e.to_s}, status: 404
      end

      private

      def not_found
        render json: { status: 0 ,message: 'Cannot find email/password combination' }, status: :not_found
      end
    end
  end
end
