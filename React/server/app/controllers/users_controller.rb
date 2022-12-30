class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  def create
    @user = User.new(user_params)
    if @user.save
      @user.id = session[:user_id]
      render json: { user: @user }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

end
