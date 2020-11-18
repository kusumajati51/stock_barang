class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'You are registered .'
      flash[:color] = 'valid'
      redirect_to root_path
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"

    end
  end
  private
  def user_param
    params.permit(:email, :no_hp, :name, :password, :password_confirmation)
  end
end
