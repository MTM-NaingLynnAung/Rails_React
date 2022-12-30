class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:login]
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { status: :created, logged_in: true, user: user }
    else
      render json: { error: 'Email or Password incorrect' }, status: 401
    end
  end

  def logout
    session[:user_id] = nil
    render json: { message: 'Logout Successfully' }
  end
end
