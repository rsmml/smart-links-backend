class Api::V1::SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    user = User.find_by!(email: params[:email]).try(:authenticate, params[:password])

    if user
      session[:user_id] = user.id
      render json: { status: :created, logged_in: true, user: user }
    else
      render json: { status: 401 }
    end
  end

  def destroy
    reset_session
    render json: { status: 200, logged_in: false, logged_out: true }
  end

  def check_user
    users = User.all
    render json: { users: users }
  end

  def logged_in
    if @current_user
      render json: { logged_in: true, user: @current_user }
    else
      render json: { logged_in: false }
    end
  end
end
